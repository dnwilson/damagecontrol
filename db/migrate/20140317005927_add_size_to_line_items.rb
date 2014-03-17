class AddSizeToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :size, :integer
  end
end
