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
    else
      flash[:danger] = "Must have a business to register a new job
      opportuntity"
      redirect_to new_business_path
    end
  end

end
