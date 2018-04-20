class CreateHotelsViews < ActiveRecord::Migration
  def change
    create_table :hotels_views do |t|
      t.references :view
      t.references :hotel
    end
    add_index :hotels_views, :view_id
    add_index :hotels_views, :hotel_id
  end
end
