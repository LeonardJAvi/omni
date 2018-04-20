class AddColumnMonthInViews < ActiveRecord::Migration
  def change
    add_column :views, :month, :string, array: true, default: []
  end
end
