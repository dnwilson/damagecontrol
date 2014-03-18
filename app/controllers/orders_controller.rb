class OrdersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :verify_is_admin, only: [:pending_orders]
  force_ssl unless Rails.env.development?

  def express
  	options = {
  		:ip => 				request.remote_ip,
  		:return_url =>         new_order_url,
		  :cancel_return_url => 	products_url,
  		:items => current_cart.line_items_hash
  	}
  	response = EXPRESS_GATEWAY.setup_purchase(current_cart.build_order.price_in_cents, 
		options)
	  redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
  end

  def new
  	@order = Order.new(:express_token => params[:token])
  end

  def index
    @orders = current_user.orders
  end

  def pending
    @orders = Order.all.where(status: "Paid")
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
    def verify_is_admin
      unless current_user.admin?
        redirect_to(root_path)
        flash[:warning] = "You do not have permission to carry out this function"
      end
    end

    def order_params
    	params.require(:order).permit(:first_name, :last_name, :card_type, 
    		:card_expires_on, :card_number, :token, :express_token, :card_verification, :billing_address, :shipping_address)
    end
end
