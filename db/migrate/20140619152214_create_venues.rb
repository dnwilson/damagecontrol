class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address
      t.string :address2
      t.string :city
      t.string :state
      t.string :country
      t.string :zipcode

      t.timestamps
    end
    add_index :venues, :id
  end
end
