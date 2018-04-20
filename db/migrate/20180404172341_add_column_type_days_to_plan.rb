class AddColumnTypeDaysToPlan < ActiveRecord::Migration
  def change
    add_column :plans, :type_days, :string
    add_column :excursions, :type_days, :string
    add_column :hotels, :type_days, :string
  end
end
