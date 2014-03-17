class LineItem < ActiveRecord::Base
	belongs_to :cart
	belongs_to :product

	after_create :dec_inventory
	before_destroy :inc_inventory

	def full_price
		unit_price * quantity
	end

	
	private
	def dec_inventory
		product = Product.find(self.product_id)
		case self.size
		when 1
			product.inventory.update_attributes(xsmall: product.inventory.xsmall - 1)
		when 2
			product.inventory.update_attributes(small: product.inventory.small - 1)
		when 3
			product.inventory.update_attributes(medium: product.inventory.medium - 1)
		when 4
			product.inventory.update_attributes(large: product.inventory.large - 1)
		when 5
			product.inventory.update_attributes(xlarge: product.inventory.xlarge - 1)
		when 6
			product.inventory.update_attributes(xxlarge: product.inventory.xxlarge - 1)
		end
	end

	def inc_inventory
		product = Product.find(self.product_id)
		case self.size
		when  1
			product.inventory.update_attributes(xsmall: product.inventory.xsmall + self.quantity)
		when  2
			product.inventory.update_attributes(small: product.inventory.small + self.quantity)
		when  3
			product.inventory.update_attributes(medium: product.inventory.medium + self.quantity)
		when  4
			product.inventory.update_attributes(large: product.inventory.large + self.quantity)
		when  5
			product.inventory.update_attributes(xlarge: product.inventory.xlarge + self.quantity)
		when  6
			product.inventory.update_attributes(xxlarge: product.inventory.xxlarge + self.quantity)
		end
	end
end
