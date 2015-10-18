class Admin::TagsController < AdminController
  def new
    @tag = Tag.new
    @tag_name = TagName.new
  end

  def create
    tag = Tag.find_or_create_by(tag_params)
    if tag.save
      tag_name = tag.tag_name = TagName.find_or_create_by(tag_name_params)
      tag_name.save
      redirect_to admin_path
    else
      flash[:errors] = "Tag not created"
      render :new
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:tag_name_id)
  end

  def tag_name_params
    params[:tag].require(:tag_name).permit(:name)
  end
end
