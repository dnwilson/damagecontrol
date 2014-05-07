class AddFieldsToTable < ActiveRecord::Migration
  def change
    add_column :galleries, :description_html, :text
    add_column :events, :description_html, :text
    add_column :videos, :description_html, :text
  end
end
