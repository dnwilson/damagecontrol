class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.integer :gallery_id
      t.integer :user_id
      t.string :image

      t.timestamps
    end
    add_index :photos, [:id, :gallery_id]
  end
end
