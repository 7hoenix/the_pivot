class BusinessAdmin::BusinessesController < BusinessAdminController
  def show
    @business = current_user.business
  end
end
