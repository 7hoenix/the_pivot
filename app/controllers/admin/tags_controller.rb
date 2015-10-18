class Admin::TagsController < AdminController
  def new
    @tag = Tag.new
  end

  def create
    tag = Tag.find_or_create_by(tag_params)
    if tag.save
      redirect_to admin_path
    else
      flash[:errors] = "Tag not created"
      render :new
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
