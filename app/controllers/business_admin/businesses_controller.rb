class BusinessAdmin::BusinessesController < BusinessAdminController
  def show
    @business = current_user.business
    @statuses = Job.pluck(:status).uniq
    @jobs = @business.jobs
  end
end
