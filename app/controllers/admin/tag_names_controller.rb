class Admin::TagNamesController < AdminController
  def new
    @tag_name = TagName.new
  end

  def create
    tag_name = TagName.find_or_create_by(tag_name_params)
    if tag_name.save
      redirect_to admin_path
    else
      flash[:errors] = "Tag not created"
      render :new
    end
  end

  def destroy
    tag_name = TagName.find(params[:id])
    tag_name.destroy
    redirect_to admin_path
  end

  private

  def tag_name_params
    params.require(:tag_name).permit(:name)
  end
end
