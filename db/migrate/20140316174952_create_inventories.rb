class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.integer :product_id
      t.integer :xsmall
      t.integer :small
      t.integer :medium
      t.integer :large
      t.integer :xlarge
      t.integer :xxlarge

      t.timestamps
    end
    add_index :inventories, [:id, :product_id], unique: true
  end
end
