class SessionsController < ApplicationController

  def create
    session_handler = SessionHandler.new(session, params)
    @user = User.find_or_create_by_oauth(oauth)

    if session_handler.apply_user(@user)
      @user.load_watched_jobs(session[:watchlist])
      redirect_back_or profile_path
    else
      flash[:notice] = session_handler.flash_notice
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    flash[:notice] = "Logged out"
    redirect_to root_path
  end

  private

  def oauth
    request.env["omniauth.auth"]
  end
end
