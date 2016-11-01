class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :store_current_location, :unless => :devise_controller?
  helper_method :current_cart
  after_action :store_location
  protected

  def store_location
    return unless request.get?
    if (request.path != "/users/sign_in" &&
        request.path != "/users/sign_up" &&
        request.path != "/users/password/new" &&
        request.path != "/users/password/edit" &&
        request.path != "/users/confirmation" &&
        request.path != "/users/sign_out" &&
        !request.xhr?) # don't store ajax calls
      session[:previous_url] = request.fullpath
    end
  end

  def after_sign_in_path_for(resource)
    session[:previous_url].gsub!('buy','') if session[:previous_url]
    session[:previous_url] || root_path
  end

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
    begin
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
    rescue
      @cart = Cart.create
      cookies.signed[:cart_id] = @cart.id
      return @cart
    end
  end

  def vaild_admin
    redirect_to raise ActionController::RoutingError.new('Not Found') unless current_user.admin?
  end

end
