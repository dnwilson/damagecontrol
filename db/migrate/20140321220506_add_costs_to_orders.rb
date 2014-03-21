class AddCostsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :shipping_cost, :decimal
    add_column :orders, :subtotal, :decimal
    add_column :orders, :total, :decimal
  end
end
