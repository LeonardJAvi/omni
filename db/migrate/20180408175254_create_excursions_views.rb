class CreateExcursionsViews < ActiveRecord::Migration
  def change
    create_table :excursions_views do |t|
      t.references :view
      t.references :excursion
    end
    add_index :excursions_views, :view_id
    add_index :excursions_views, :excursion_id
  end
end
