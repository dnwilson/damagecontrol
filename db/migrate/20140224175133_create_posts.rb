class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :post_title
      t.string :post_content
      t.integer :user_id

      t.timestamps
    end
    add_index :posts, [:id, :user_id], :unique => true
  end
end
