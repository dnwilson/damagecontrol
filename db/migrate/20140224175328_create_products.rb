class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.boolean :downloadable, :default => false
      t.decimal :price

      t.timestamps
    end
    add_index :products, :id, :unique => true
  end
end
