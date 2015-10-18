class BusinessAdmin::BusinessesController < BusinessAdminController
  def show
    binding.pry
    @business = current_user.business
    @statuses = Job.pluck(:status).uniq
    @jobs = @business.jobs
  end
end
