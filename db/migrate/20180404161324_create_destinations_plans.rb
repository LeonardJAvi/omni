class CreateDestinationsPlans < ActiveRecord::Migration
  def change
    create_table :destinations_plans do |t|
      t.references :destination
      t.references :plan
    end
    add_index :destinations_plans, :destination_id
    add_index :destinations_plans, :plan_id
  end
end
