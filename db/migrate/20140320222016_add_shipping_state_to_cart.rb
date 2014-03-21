class AddShippingStateToCart < ActiveRecord::Migration
  def change
    add_column :carts, :shipping_state, :string
  end
end
