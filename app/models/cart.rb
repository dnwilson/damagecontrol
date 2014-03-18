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
	          # :quantity => line_item.quantity,
	          :description => line_item.product.description,
	          :amount => line_item.gross_price_in_cents
	        }
	    end
	end
end
