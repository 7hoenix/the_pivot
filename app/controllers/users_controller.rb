class UsersController < ApplicationController
  # before_filter :authorize

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:notice] = "Account created"
      redirect_back_or profile_path
    else
      flash[:errors] = "Account not created"
      render :new
    end
  end

  def show
    @user = current_user
    @jobs = Job.all
    @watchlist = Job.where(id: session[:watchlist])
    if !session[:watchlist].nil?
      @wjobs = Job.find(session[:watchlist])
    end
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :display_name, :email,
      :password)
  end

  def authorize
    unless current_user
      redirect_to login_path, alert: "Sensei says: 'You are not authorized'"
    end
  end

end
