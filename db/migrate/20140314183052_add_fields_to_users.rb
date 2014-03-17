class AddFieldsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :phone_number, :string
    add_column :users, :billing_address1, :string
    add_column :users, :billing_address2, :string
    add_column :users, :billing_state, :string
    add_column :users, :billing_zip, :string
    add_column :users, :billing_city, :string
    add_column :users, :billing_country, :string
    add_column :users, :shipping_first_name, :string
    add_column :users, :shipping_last_name, :string
    add_column :users, :shipping_address1, :string
    add_column :users, :shipping_address2, :string
    add_column :users, :shipping_state, :string
    add_column :users, :shipping_zip, :string
    add_column :users, :shipping_city, :string
    add_column :users, :shipping_country, :string
  end
end
