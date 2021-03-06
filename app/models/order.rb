class Order < ActiveRecord::Base
	belongs_to :cart
	belongs_to :user
	has_many :transactions, class_name: "OrderTransaction"
	# serialize :params

	validate :validate_card, on: :create

	attr_accessor :card_number, :card_verification

	def purchase
		response = process_purchase
		transactions.create!(action: "purchase", amount: price_in_cents, response: response)
		cart.update_attribute(:purchased_at, Time.now) if response.success?
		# transactions.update_attributes(status: "Paid") if response.success?
		response.success?
	end

	def price_in_cents
		(cart.total_price*100).round
	end

	def express_token=(token)
	  # write_attribute(:express_token, token)
	  self[:express_token] = token
	  if new_record? && !token.blank?
	    details = EXPRESS_GATEWAY.details_for(token)
	    payment_details = details.params["PaymentDetails"]["ShipToAddress"]
	    self.express_payer_id = details.payer_id
	    self.first_name = details.params["first_name"]
	    self.last_name = details.params["last_name"]
	    self.shipping_address = payment_details["Street1"]
	    self.shipping_address2 = payment_details["Street2"]
	    self.shipping_city = payment_details["CityName"]
	    self.shipping_state = payment_details["StateOrProvince"]
	    self.shipping_zip = payment_details["PostalCode"]
	    self.shipping_country = payment_details["CountryName"]
	    self.shipping_cost = details.params["shipping_total"]
	    self.subtotal = details.params["item_total"]
	    self.total = details.params["order_total"]
	  end
	end

	def order_items(token)
		details = EXPRESS_GATEWAY.details_for(token)
		details.params["PaymentDetails"]["PaymentDetailsItem"]
	end

	def pending
		where(status: "Paid")
	end

	private
	
	def process_purchase
		if express_token.blank?
			STANDARD_GATEWAY.purchase(price_in_cents, credit_card, standard_purchase_options)
		else
			EXPRESS_GATEWAY.purchase(price_in_cents, express_purchase_options)
		end
	end

	def standard_purchase_options
		{
			ip: 				ip_address,
			billing_address: 	{
				name: 		"Dane Wilson",
				address1: 	"111 Big Road",
				city: 		"Brooklyn", 
				state: 		"NY",
				country: 	"US",
				zip: 		"10001"
			} 
		}		
	end

	def express_purchase_options
		{
			:ip 		=> ip_address,
			:token 		=> express_token,
			:payer_id 	=> express_payer_id
		}
	end

	def validate_card
		if express_token.blank? && !credit_card.valid?
			credit_card.errors.full_messages.each do |message|
				# errors.add_to_base message
				errors.add :base, message
			end			
		end
	end


	def credit_card
		@credit_card ||= ActiveMerchant::Billing::CreditCard.new(
			brand: 						card_type,
			number: 					card_number,
			verification_value: 		card_verification,
			month:  					card_expires_on.month,
			year: 						card_expires_on.year,
			first_name: 				first_name,
			last_name: 					last_name 
		)
	end

	private
		def remove_from_inventory
			if self.last.transactions.last.params["PaymentInfo"]["PaymentStatus"] = "Completed"
				cart.line_items.each do |line_item|
					line_item.dec_inventory
				end
			end
		end
end
