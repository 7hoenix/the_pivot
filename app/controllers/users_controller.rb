class UsersController < ApplicationController
  # before_filter :authorize

  def show
    if !current_user
      redirect_to root_path
    else
      @user = current_user
      @jobs = Job.all.sample(4)
      @watchlist = @user.watched
    end
  end

  def edit
    @user = current_user
    @tags = TagName.all
  end

  def update
    user = current_user
    user_params[:tag_ids].each do |tag_name_id|
      Tag.find_or_create_by(taggable_id: user.id, taggable_type: "User", tag_name_id: tag_name_id)
    end
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
