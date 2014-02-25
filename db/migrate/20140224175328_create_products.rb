class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :prod_name
      t.string :prod_description
      t.boolean :prod_downloadable, :default => false
      t.integer :prod_price, 		:default => 0

      t.timestamps
    end
    add_index :products, :id, :unique => true
  end
end
