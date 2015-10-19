class UsersController < ApplicationController
  # before_filter :authorize

  def show
    @user = current_user
    @jobs = Job.all.sample(4)
    @watchlist = @user.watched
  end

  def edit
    @user = current_user
  end

  def update
    user = current_user
    user.tags << Tag.where(id: user_params[:tag_ids])
    if user.save
      flash[:message] = "Preferences saved"
      redirect_to profile_path
    else
      flash[:errors] = "Preferences did not save properly"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(tag_ids: [])
  end

  def authorize
    unless current_user
      redirect_to login_path, alert: "Sensei says: 'You are not authorized'"
    end
  end

end
