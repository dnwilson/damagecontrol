class OrdersController < ApplicationController
  before_filter :authenticate_user!
  force_ssl unless Rails.env.development?

  def express
  	options = {
  		:ip => 				request.remote_ip,
  		:return_url =>         new_order_url,
		:cancel_return_url => 	products_url,
  		:items =>
  			current_cart.line_items.each do |line_item|
	  			 [{
		  			:name 			=> line_item.product.name, 
		  			:description 	=> line_item.product.description,
		  			:amount 		=> line_item.product.price
	  			}]
  			end
  		
  	}
  	response = EXPRESS_GATEWAY.setup_purchase(current_cart.build_order.price_in_cents, 
		options
		# :ip                => request.remote_ip,
		# :return_url        => new_order_url,
		# :cancel_return_url => products_url
	)
	redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
  end

  def new
  	@order = Order.new(:express_token => params[:token])
  end

  def create
  	@order = current_cart.build_order(order_params)
  	@order.ip_address = request.remote_ip
  	@order.user_id = current_user.id
  	if @order.save
  		if @order.purchase
  			render :action => 'success'
  		else
  			render :action => 'failure'
  		end
  	else
  		render :action => 'new'
  	end
  end

  private

  def order_params
  	params.require(:order).permit(:first_name, :last_name, :card_type, 
  		:card_expires_on, :card_number, :card_verification, :billing_address, :shipping_address)
  end
end
