class Admin::DashboardController < AdminController
  def index
    @tag_names = TagName.all
  end
end
