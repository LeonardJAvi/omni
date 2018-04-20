module Admin
  # ViewsController
  class ViewsController < AdminController
    before_action :set_view, only: [:show, :edit, :update, :destroy]
    before_action :show_history, only: [:index]
    before_action :get_request, only: [:index, :show]

    # GET /views
    def index
      @q = View.ransack(params[:q])
      views = @q.result(distinct: true)
      @objects = views.page(@current_page)
      @total = views.size
      if !@objects.first_page? && @objects.size.zero?
        redirect_to views_path(page: @current_page.to_i.pred, search: @query)
      end
      @views = View.all.reverse
      respond_to do |format|
        format.html
        format.xls { send_data(@views.to_xls) }
      end
    end

    # GET /views/1
    def show
    end

    # GET /views/new
    def new
      @view = View.new
    end

    # GET /views/1/edit
    def edit
    end

    # POST /views
    def create
      @view = View.new(view_params)
      @view.plan_ids = params[:view][:plan_ids]
      @view.hotel_ids = params[:view][:hotel_ids]
      @view.excursion_ids = params[:view][:excursion_ids]
      params[:view][:month].shift
      @view.month = params[:view][:month]
      if @view.save
        redirect(@view, params)
      else
        render :new
      end
    end

    # PATCH/PUT /views/1
    def update
      @view.slug = view_params[:name].downcase.tr('áéíóúñÁÉÍÓÚÑ', 'aeiounAEIOUN').parameterize
      @view.plan_ids = params[:view][:plan_ids]
      @view.hotel_ids = params[:view][:hotel_ids]
      @view.excursion_ids = params[:view][:excursion_ids]
      params[:view][:month].shift
      @view.month = params[:view][:month]
      if @view.update(view_params)
        redirect(@view, params)
      else
        render :edit
      end
    end

    def clone
      @view = View.clone_record params[:view_id]

      if @view.save
        redirect_to admin_views_path
      else
        render :new
      end
    end

    # DELETE /views/1
    def destroy
      @view.destroy
      redirect_to admin_views_path, notice: actions_messages(@view)
    end

    def destroy_multiple
      View.destroy redefine_ids(params[:multiple_ids])
      redirect_to(
        admin_views_path(page: @current_page, search: @query),
        notice: actions_messages(View.new)
      )
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_view
      @view = View.find(params[:id])
    end

    def get_request
      @request = request
    end

    # Only allow a trusted parameter "white list" through.
    def view_params
      params.require(:view).permit(:name, :subtitle, :banner, :slug, :plan_ids, :active, :month)
    end

    def show_history
      get_history(View)
    end
  end
end
