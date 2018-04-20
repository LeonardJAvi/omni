class AddColumnCoverToDestinations < ActiveRecord::Migration
  def change
    add_column :destinations, :cover, :string
  end
end
