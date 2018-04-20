class AddColumnOfferToPlan < ActiveRecord::Migration
  def change
    add_column :excursions, :type_coupons, :string
    add_column :excursions, :offer, :string, default: ''
    add_column :excursions, :plus, :string, default: ''

    add_column :hotels, :type_coupons, :string
    add_column :hotels, :offer, :string, default: ''
    add_column :hotels, :plus, :string, default: ''

    add_column :plans, :type_coupons, :string
    add_column :plans, :offer, :string, default: ''
    add_column :plans, :plus, :string, default: ''

  end
end
