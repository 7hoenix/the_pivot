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
    byebug
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      if @user.user?
        session[:user_id] = @user.id
        redirect_back_or profile_path
      elsif @user.admin?
        session[:user_id] = @user.id
        flash[:notice] = "Admin logged in."
        redirect_to '/admin'
      end
    else
      flash[:notice] = "Invalid Login: try again"
      render :new
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
