class UsersController < ApplicationController
  def show
    if !current_user
      redirect_to root_path
    else
      @user = current_user
      @tag_name_ids = current_user.tags.pluck(:tag_name_id).uniq
      @jobs = Job.joins(:tags).where(tags: {tag_name_id: @tag_name_ids}).sample(3)
      @watchlist = @user.watched
      @resumes = @user.resumes
    end
  end

  def edit
    @user = current_user
    @tags = TagName.all
  end

  def update
    user = current_user
    if user.save
      user.tags.delete_all
      user_params[:tag_ids].each do |tag_name_id|
        Tag.find_or_create_by(taggable_id: user.id, taggable_type: "User", tag_name_id: tag_name_id)
      end
      flash[:message] = "Preferences saved"
      redirect_to profile_path
    else
      flash[:errors] = "Preferences did not save properly"
      render :edit
    end
  end

  private

  def user_params
    params[:user] ? params.require(:user).permit(tag_ids: []) : { tag_ids: [] }
  end
end
