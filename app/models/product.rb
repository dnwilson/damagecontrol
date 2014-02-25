class Product < ActiveRecord::Base
	
	belongs_to :product_category

	validates :name, presence: true, length: {minimum: 3}
	validates :description, presence: true
	validates :price, presence: true
end
