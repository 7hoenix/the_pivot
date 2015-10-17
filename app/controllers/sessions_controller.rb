class SessionsController < ApplicationController

  def new
    if session[:user_id]
      flash[:notice] = "Please Log out First"
      redirect_to root_path
    else
      @user = User.new
    end
  end

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
    session[:user_id] = nil
    flash[:notice] = "Sensei says: 'sayonara'"
    redirect_to root_path
  end

  private

  def oauth
    request.env["omniauth.auth"]
  end
end
