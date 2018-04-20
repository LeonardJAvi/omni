class CreateViews < ActiveRecord::Migration
  def change
    create_table :views do |t|
      t.string :banner
      t.string :name
      t.string :subtitle
      t.string :slug
      t.boolean :active

      t.timestamps null: false
    end
  end
end
