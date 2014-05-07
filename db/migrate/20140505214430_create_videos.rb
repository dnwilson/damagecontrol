class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :name
      t.text :description
      t.integer :event_id
      t.date :date
      t.string :image
      t.string :url

      t.timestamps
    end
  end
end
