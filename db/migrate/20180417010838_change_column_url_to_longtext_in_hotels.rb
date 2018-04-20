class ChangeColumnUrlToLongtextInHotels < ActiveRecord::Migration
  def change
    change_column :hotels, :url, :text, array: true
    change_column :plans, :url, :text, array: true
    change_column :excursions, :url, :text, array: true
  end
end
