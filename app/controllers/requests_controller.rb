class RequestsController < ApplicationController
  def new
    @request = Request.new
    @user = current_user
    @current_resumes = @user.resumes
    #is this unsecure??
    @job = Job.find(params[:job_id])

    @resume = Resume.new
    @repositories ||= RepositoryHandler.new(current_client, current_user).populate_repositories
  end

  def create
    binding.pry

  end
end
