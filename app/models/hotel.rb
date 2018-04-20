# Hotel Model
class Hotel < ActiveRecord::Base
  include ActivityHistory
  include CloneRecord
  # include ActiveModel
  require 'csv'
  mount_uploader :banner, AttachmentUploader
  acts_as_list
  belongs_to :destination
  has_and_belongs_to_many :views

  # validate :custom_url_length

  validate :custom_price

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  validates_presence_of :title, :url, :destination_id, :banner, :type_days, :days
  validates :title, :slug, uniqueness: true

  serialize :price
  serialize :url

  def custom_price
    if self.price["cop"].to_i.zero? || self.price["usd"].to_i.zero?
      errors.add(:price, "Error vale")
    end
  end

  def custom_url_length
    byebug
    url = self.url.split('/').length
    if url
      errors.add(:url, "Error vale")
    end
  end

  def destinos_names
    if self.destination.name.include?(' ')
      destinos_planes = self.destination.name.downcase.tr('áéíóúñÁÉÍÓÚÑ', 'aeiounAEIOUN').split(' ').join('-')
    else
      destinos_planes = self.destination.name.downcase.tr('áéíóúñÁÉÍÓÚÑ', 'aeiounAEIOUN')
    end
  end

  def singularize_string(type_days)
    type_days = type_days.split("")
    type_days.pop
    type_days.join("").capitalize
  end

  def url_landing(url, month)
    return if url.blank?

    t = Date.today
    t_oher_month = Date.civil(t.year, month.to_i)

    #Si es el mes actual
    if month == t.strftime("%m")
      url = month_actually(url, month, t)
    else #Si es un mes diferente al actual del mismo año
      url = other_mont(url, month) if month != t
    end

  end

  def month_actually(url, month, t)
    url = url.split('/')
    start_date = url[6].split('-')
    start_date.second.replace(month)
    start_date.third.replace((t+1).strftime("%d"))
    start_date = start_date.join('-')
    url[6].replace(start_date)

    end_date = url[7].split('-')
    end_date.second.replace(month)
    end_date.third.replace((t+2).strftime("%d"))
    end_date = end_date.join('-')
    url[7].replace(end_date)
    url = url.join('/')
  end

  def other_mont(url, month)
    url = url.split('/')
    start_date = url[6].split('-')
    start_date.second.replace(month)
    start_date.third.replace("01")
    start_date = start_date.join('-')
    url[6].replace(start_date)


    end_date = url[7].split('-')
    end_date.second.replace(month)
    end_date.third.replace("02")
    end_date = end_date.join('-')
    url[7].replace(end_date)
    url = url.join('/')
  end


  def self.search_price(id, currency, minimo, maximo)
    Hotel.select {|hotel| hotel.destination_id == id.to_s && hotel.price[currency] >= minimo && hotel.price[currency] <= maximo}
  end


  # Fields for the search form in the navbar
  def self.search_field
    :banner_or_title_or_subtitle_or_days_or_url_or_destination_id_cont
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      begin
        Hotel.create! row.to_hash
      rescue => err
      end
    end
  end
end
