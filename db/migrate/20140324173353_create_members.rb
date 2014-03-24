class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.boolean :artist, :default => false 
      t.string :title
      t.text :bio
      t.string :facebook
      t.string :twitter
      t.string :instagram
      t.string :soundcloud
      t.string :reverbnation
      t.string :youtube

      t.timestamps
    end
    add_index :members, :id, :unique => true
  end
end
