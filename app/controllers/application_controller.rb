class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :store_current_location, :unless => :devise_controller?
  helper_method :current_cart
  protected

  def store_current_location
    store_location_for(:user, request.url)
  end

  def current_qty
    current_cart.total
  end

  def after_sign_out_path_for(resource)
    request.referrer || root_path
  end

  def current_cart
    if @cart
      return @cart
    else
      if cookies.signed[:cart_id]
        @cart = Cart.find( cookies.signed[:cart_id] )
      else
        @cart = Cart.create
        cookies.signed[:cart_id] = @cart.id
      end
      return @cart
    end
  end

  def vaild_admin
    redirect_to raise ActionController::RoutingError.new('Not Found') unless current_user.admin?
  end

end
