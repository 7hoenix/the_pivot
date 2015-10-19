class Admin::DashboardController < AdminController
  def index
    @tags = Tag.all
  end
end
