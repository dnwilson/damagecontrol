class AddImageColumnToProducts < ActiveRecord::Migration
  def self.up
    add_attachment :products, :image
  end

  def self.down
  	add_attachment :products, :image
  end
end
