class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :create_cart
  before_action :create_cart
  helper_method :current_user

  def create_cart
    @current_cart = Cart.new(session[:cart])
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end

  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  def store_location
    session[:forwarding_url] = request.url if request.get?
  end

  def render_404
    raise ActionController::RoutingError.new("Not Found")
  end

end
