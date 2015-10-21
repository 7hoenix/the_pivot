class JobApplicationsController < ApplicationController

  def new
    store_location
    @job_application = JobApplication.new
    @user = current_user
    @current_resumes = @user.resumes
    #is this unsecure??
    @job = Job.find(params[:job_id])

    @resume = Resume.new
    @repositories ||= RepositoryHandler.new(current_client, current_user).populate_repositories
  end

  def create
    job_application = current_user.job_applications.build(job_application_params)
    if job_application.save
      flash[:success] = "Application Submitted"
      redirect_to profile_path
    else
      flash[:errors] = "Application not subbmitted"
      render :new
    end
  end

  private

  def job_params
    params.permit(:job_id)
  end

  def job_application_params
    params.require(:job_application).permit(:resume_id).merge(job_params)
  end
end
