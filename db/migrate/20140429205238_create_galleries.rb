class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :name
      t.string :description
      t.string :preview_pic
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end
    add_index :galleries, [:id, :user_id]
    add_index :galleries, [:id, :user_id, :event_id]
    add_index :galleries, [:id, :event_id]
  end
end
