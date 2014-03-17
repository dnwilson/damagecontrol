class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.boolean :downloadable, :default => false
      t.decimal :price
      t.integer :product_category_id

      t.timestamps
    end
    add_index :products, :id, :unique => true
    add_index :products, [:id, :product_category_id], :unique => true
  end
end
