class LineItem < ActiveRecord::Base
	belongs_to :cart
	belongs_to :product

	# after_create :dec_inventory
	# before_destroy :inc_inventory

	def full_price
		unit_price * quantity
	end

	def gross_price_in_cents
		(self.full_price * 100).round
	end

	def dec_inventory
		product = Product.find(self.product_id)
		if product.product_category_id = 1
			case self.size
			when 1
				product.inventory.update_attributes(xsmall: product.inventory.xsmall - self.quantity)
			when 2
				product.inventory.update_attributes(small: product.inventory.small - self.quantity)
			when 3
				product.inventory.update_attributes(medium: product.inventory.medium - self.quantity)
			when 4
				product.inventory.update_attributes(large: product.inventory.large - self.quantity)
			when 5
				product.inventory.update_attributes(xlarge: product.inventory.xlarge - self.quantity)
			when 6
				product.inventory.update_attributes(xxlarge: product.inventory.xxlarge - self.quantity)
			end
		end
	end
	
	private

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
