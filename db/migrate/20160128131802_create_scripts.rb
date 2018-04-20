class CreateScripts < ActiveRecord::Migration
  def change
    create_table :scripts do |t|
      t.string :name
      t.string :script
      t.string :url

      t.timestamps null: false
    end
  end
end
