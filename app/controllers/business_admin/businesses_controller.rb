class BusinessAdmin::BusinessesController < BusinessAdminController

  def show
    binding.pry
    @business = current_user.business

  end
end
