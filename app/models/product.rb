class Product < ActiveRecord::Base

	validates :prod_name, presence: true, length: {minimum: 3}
	validates :prod_description, presence: true
	validates :prod_price, presence: true
end
