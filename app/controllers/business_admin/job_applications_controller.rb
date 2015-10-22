class BusinessAdmin::JobApplicationsController < BusinessAdminController
  def index
    @job = Job.find(params[:job_id])
    @job_applications = @job.job_applications
  end

end
