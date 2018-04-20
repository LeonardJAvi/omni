class RemoveUrlFromPlans < ActiveRecord::Migration
  def change
    remove_column :plans, :url, :string
    remove_column :hotels, :url, :string
    remove_column :excursions, :url, :string

    add_column :plans, :url, :string, array: true
    add_column :hotels, :url, :string, array: true
    add_column :excursions, :url, :string, array: true

  end
end
