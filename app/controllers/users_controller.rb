class UsersController < ApplicationController
  # before_filter :authorize

  def show
    @user = current_user
    @jobs = Job.all
    if !session[:watchlist].nil?
      @wjobs = Job.find(session[:watchlist])
    end
  end

  private

  def authorize
    unless current_user
      redirect_to login_path, alert: "Sensei says: 'You are not authorized'"
    end
  end

end
