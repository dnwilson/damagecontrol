class OrderTransaction < ActiveRecord::Base
	belongs_to :order
	serialize :params

	before_save :remove_from_inventory

	def response=(response)
		self.success		= response.success?
		self.authorization	= response.authorization
		self.message		= response.message
		self.params			= response.params
	rescue ActiveMerchant::ActiveMerchantError => e 
		self.success		= false
		self.authorization	= nil
		self.message		= e.message
		self.params			= {}
	end



	private
		def remove_from_inventory
			if self.params["PaymentInfo"]["PaymentStatus"] = "Completed"
				order.cart.line_items.each do |line_item|
					line_item.dec_inventory
				end
			end
		end
end
