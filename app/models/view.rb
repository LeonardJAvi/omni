# View Model
class View < ActiveRecord::Base
  include ActivityHistory
  include CloneRecord
  extend FriendlyId
  has_and_belongs_to_many :plans
  has_and_belongs_to_many :hotels
  has_and_belongs_to_many :excursions
  mount_uploader :banner, AttachmentUploader
  # after_create :build_controller, :build_routes, :build_view, on: :create
  validates :name, :slug, uniqueness: true
  validates_presence_of :name, :banner, :subtitle
  friendly_id :name, use: [:slugged, :finders]

  serialize :month

  def get_url(view, request)
    request.protocol + request.host_with_port + "/landing/#{view.slug}/cop"
  end

  def self.month_all
    [
      ['Enero','01'],
      ['Febrero','02'],
      ['Marzo','03'],
      ['Abril','04'],
      ['Mayo','05'],
      ['Junio','06'],
      ['Julio','07'],
      ['Agosto','08'],
      ['Septiembre','09'],
      ['Octubre','10'],
      ['Noviembre','11'],
      ['Diciembre','12']
    ]
  end

  def month_name(month)
    months = [
              'Enero',
              'Febrero',
              'Marzo',
              'Abril',
              'Mayo',
              'Junio',
              'Julio',
              'Agosto',
              'Septiembre',
              'Octubre',
              'Noviembre',
              'Diciembre'
            ]
    months.each_with_index do |m, i|
      return m if (i+1).eql?(month.to_i)
    end
  end

  # def build_controller
  #   folder = "#{Rails.root}/app/controllers/app"
  #   view_controller = File.readlines("#{folder}/view_controller.rb")
  #   vistas_coment = 0
  #   view_controller.each { |line| vistas_coment = view_controller.find_index(line) if line.include?('#KepplerViews') }
  #   view_controller.insert(vistas_coment.to_i+2, template_method_controller)
  #   view_controller = view_controller.join("")
  #   File.write("#{folder}/view_controller.rb", view_controller)
  # end
  #
  # def template_method_controller
  #   name = build_name(self.name)
  #   "\n
  #   def #{name}
  #     if !@view.active
  #       CanCan::AccessDenied.new(
  #         redirect_to main_app.not_authorized_path
  #       )
  #     end
  #   end\n"
  # end
  #
  # def build_name(name)
  #   byebug
  #   name.downcase.tr('áéíóúñ', 'aeioun').split(" ").join("_")
  # end
  #
  # def build_routes
  #   folder = "#{Rails.root}/config"
  #   routes = File.readlines("#{folder}/routes.rb")
  #   keppler_view = 0
  #   routes.each { |line| keppler_view = routes.find_index(line) if line.include?('#KepplerViews') }
  #   routes.insert(keppler_view.to_i+1, "  get '#{self.name}/:view_id/:currency', to: 'app/view##{self.name}' \n")
  #   routes = routes.join("")
  #   File.write("#{folder}/routes.rb", routes)
  # end
  #
  # def build_view
  #   route = "#{Rails.root}/app/views/app/view"
  #   route_template = "#{Rails.root}/app/views/app/view/template.haml"
  #   template = File.readlines("#{route_template}")
  #   template = template.join("")
  #   File.new("#{Rails.root}/app/views/app/view/#{self.name}.haml", "w+")
  #   File.write("#{Rails.root}/app/views/app/view/#{self.name}.haml", template)
  # end

  # Fields for the search form in the navbar
  def self.search_field
    :name_or_active_cont
  end
end
