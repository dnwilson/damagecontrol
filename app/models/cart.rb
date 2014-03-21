class Cart < ActiveRecord::Base
	has_many :line_items
	has_one :order

	def total_price
		# convert to array so it doesn't try to do sum on database directly
		line_items.to_a.sum(&:full_price)
	end

	def line_items_hash
		self.line_items.map do |line_item|
	        {
	          :name => Product.find(line_item.product_id).name,
	          :quantity => line_item.quantity,
	          :description => line_item.product.description,
	          :amount => line_item.product.in_cents
	        }
	    end
	end

	def shipping_cost
		if shipping_state == 'New York'
			0
		elsif shipping_state == 'Canada'
			10.00
		else
			6.00
		end
	end

	def shipping_cost_in_cents
		if shipping_state == 'New York'
			0
		elsif shipping_state == 'Canada'
			1000
		else
			600
		end
	end

end
