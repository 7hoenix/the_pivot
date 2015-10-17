class SessionsController < ApplicationController

  def create
    @user = User.find_or_create_by_oauth(oauth)
    if @user
      session[:user_id] = @user.id
      redirect_back_or profile_path
    else
      flash[:notice] = "Invalid Login: try again"
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
