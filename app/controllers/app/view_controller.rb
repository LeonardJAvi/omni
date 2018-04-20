module App
  # FrontsController
  class ViewController < FrontController
    before_action :set_view

    #KepplerViews

    def promotion
      destinos_acts = @view.excursions.map{|act| act.destination.name}.uniq
      destinos_hotel = @view.hotels.map{|hotel| hotel.destination.name}.uniq
      destinos_planes = @view.plans.map{ |plan| plan.destinations.map{ |destino| destino.name  } }
      @destinos = (destinos_acts + destinos_hotel + destinos_planes).flatten.uniq

      if !@view.active
        CanCan::AccessDenied.new(
          redirect_to main_app.not_authorized_path
        )
      end
    end

    private

    def set_view
      @currency    = params['currency']
      @view = View.find(params[:view_id])
    end

  end
end


# def fogata
#   if !@fogata = true
#     CanCan::AccessDenied.new(
#       redirect_to main_app.not_authorized_path
#     )
#   end
# end
#
# def semanasanta
#   @destinations = "Funciona"
#   byebug
# end
