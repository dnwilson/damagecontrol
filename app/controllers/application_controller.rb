class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def current_cart
    if session[:cart_id]
      @current_cart ||= Cart.find(session[:cart_id])
      session[:cart_id] = nil if @current_cart.purchased_at
    end
    if session[:cart_id].nil?
      @current_cart = Cart.create!
      session[:cart_id] = @current_cart.id
    end
    @current_cart
  end

  def authenticate_active_admin_user!
    authenticate_user!
    unless current_user.admin?
      flash[:alert] = "You are not authorized to access this resource!"
      redirect_to root_path
    end
  end

  private

    def record_not_found
      render 'pages/404', :status => 404
    end
end
