class Admin::TagsController < AdminController
  def new
    @tag = Tag.new
    @tag_name = TagName.new
  end
end
