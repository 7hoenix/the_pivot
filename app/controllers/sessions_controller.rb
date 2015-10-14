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
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      if @user.user?
        session[:user_id] = @user.id
        flash[:notice] = "Sensei says: 'Welcome to the dojo'"
        redirect_to user_path(@user)
      elsif @user.admin?
        session[:user_id] = @user.id
        flash[:notice] = "Admin logged in."
        redirect_to '/admin'
      end
    else
      flash[:notice] = "Sensei says: 'Invalid Login: try again'"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Sensei says: 'sayonara'"
    redirect_to root_path
  end

end
