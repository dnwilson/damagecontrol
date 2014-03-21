class OrdersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :verify_is_admin, only: [:pending_orders]
  force_ssl unless Rails.env.development?

  def express

  # 	options = {
  # 		:ip => 				request.remote_ip,
  # 		:return_url =>         new_order_url,
		#   :cancel_return_url => 	products_url,
  #     :subtotal => current_cart.build_order.price_in_cents,
  #     :tax      => 20,
  #     :shipping => 20,
  #     :handling      => 20,
  # 		:items => current_cart.line_items_hash
  # 	}
  #   total = current_cart.build_order.price_in_cents + options[:tax] + options[:shipping] + options[:handling]
  # 	response = EXPRESS_GATEWAY.setup_purchase(total, 
		# options)
    tax = 0
    shipping = current_cart.shipping_cost_in_cents
    handling = 0
    subtotal = current_cart.build_order.price_in_cents
    total = current_cart.build_order.price_in_cents + tax + shipping + handling
    response = EXPRESS_GATEWAY.setup_purchase(
      total,
      :ip =>        request.remote_ip,
      :return_url =>         new_order_url,
      :cancel_return_url =>   products_url,
      :subtotal => current_cart.build_order.price_in_cents,
      :tax      => tax,
      :shipping => shipping,
      :handling => 0,
      :items => current_cart.line_items_hash
    )
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
