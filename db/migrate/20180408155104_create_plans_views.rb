class CreatePlansViews < ActiveRecord::Migration
  def change
    create_table :plans_views do |t|
      t.references :view
      t.references :plan
    end
    add_index :plans_views, :view_id
    add_index :plans_views, :plan_id
  end
end
