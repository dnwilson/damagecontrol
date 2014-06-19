class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :name
      t.string :description
      t.string :preview_pic
      t.date :date
      t.integer :event_id

      t.timestamps
    end
    add_index :galleries, :id
    add_index :galleries, [:id, :event_id]
  end
end
