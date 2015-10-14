class JobsController < ApplicationController

  def index
    @jobs = Job.active
  end

  def post
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    if current_user && current_user.has_business?
      @job = Job.new
    elsif current_user
      flash[:danger] = "Must have a business to register a new job
      opportuntity"
      redirect_to new_business_path
    else
      flash[:danger] = "Log in to post a new job"
      redirect_to login_path
    end
  end

end
