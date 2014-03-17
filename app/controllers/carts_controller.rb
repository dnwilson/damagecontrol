class CartsController < ApplicationController
	before_filter :has_item?
	
	def show
		@cart = current_cart
	end

	private

		def has_item?
			unless !session[:cart_id].nil?
				redirect_to shop_path
				flash[:warning] = "You must add an item your cart before you can view it."
			end
		end
end
