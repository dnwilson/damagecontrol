class OrdersController < ApplicationController
  before_filter :authenticate_user!
  force_ssl unless Rails.env.development?

  def new
  	@order = Order.new
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
