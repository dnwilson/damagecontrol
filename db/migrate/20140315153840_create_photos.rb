class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :desc
      t.belongs_to :imageable, polymorphic: true

      t.timestamps
    end
    add_index :photos, [:imageable_id, :imageable_type]
  end
end
