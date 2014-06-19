class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
		t.string :name
		t.text :description
		t.date :date
		t.string :flyer
		t.integer :venue_id

      t.timestamps
    end
    add_index :events, :id, unique: true
    add_index :events, [:id, :venue_id]
  end
end
