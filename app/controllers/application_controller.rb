class ApplicationController < ActionController::Base
  before_action :current_client
  protect_from_forgery with: :exception
  helper_method :current_user


  def current_client
    client ||= Octokit::Client.new \
      client_id: ENV["github_key"],
      client_secret: ENV["github_secret"]
    client
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
