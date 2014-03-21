class CartsController < ApplicationController
	before_filter :has_item?
	
	def show
		@cart = current_cart
	end

	def update
		@cart = current_cart
		@cart.update_attributes!(shipping_state: params[:cart][:shipping_state])
		respond_to do |format|
			format.html{redirect_to mycart_path(@cart, @cart.shipping_state)}
			format.js
		end
	end

	private

		def has_item?
			unless !session[:cart_id].nil?
				redirect_to shop_path
				flash[:warning] = "You must add an item your cart before you can view it."
			end
		end
end
