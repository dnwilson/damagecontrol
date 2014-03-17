class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.text :body_html
      t.integer :user_id

      t.timestamps
    end
    add_index :posts, [:id, :user_id], :unique => true
  end
end
