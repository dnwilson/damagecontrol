class LineItemsController < ApplicationController
	include ApplicationHelper

	# before_filter :verify_available, only: [:create]

	def create
		@product = Product.find(params[:product_id])
		if !current_cart.line_items.find_by_product_id(@product.id).nil?
			@line_item = current_cart.line_items.find_by_product_id(@product.id)
			@line_item.update_attributes(cart: current_cart, quantity: @line_item.quantity + 1, 
				size: params[:size])
			flash[:notice] = "Updated #{@product.name} quantity in cart."
			redirect_to mycart_url
		else
			@line_item = LineItem.create!(cart: current_cart, product: @product, quantity: 1, 
			unit_price: @product.price, size: params[:size])
			flash[:notice] = "Added #{@product.name} to cart."
			redirect_to mycart_url
		end
	end

	def destroy
		@product = Product.find(params[:id])
		@line_item = current_cart.line_items.find_by_product_id(@product.id)
		# @product.inc_inventory(@line_item.quantity, @line_item.size)
		@line_item.destroy
		flash[:notice] = "Product removed from cart."
        redirect_to mycart_path
	end

	def update
		@line_item = LineItem.find(params[:id])
		@line_item.update_attributes(cart: current_cart, quantity: params[:line_item][:quantity])
		respond_to do |format|
			format.html{redirect_to mycart_path}
			format.js
		end
	end

	private
		def set_size(selected)
			@size
			case @size
			when selected == 'xsmall'
				@size = 1
			when selected == 'small'
				@size = 2
			when selected == 'medium'
				@size = 3
			when selected == 'large'
				@size = 4
			when selected == 'xlarge'
				@size = 5
			when selected == 'xxlarge'
				@size = 6
			end
		end

		# def verify_available
		# 	@product = Product.find(params[:id])
		# 	@inventory = Product.find(params[:inventory])
		# 	if @product.product_category_id = 1
		# 		unless @product.sizes.find(@inventory).qty > 0
		# 			flash[:error] = "This product is current sold out. Please try another size."
		# 			redirect_to shop_path
		# 		end
		# 	end
		# end
end
