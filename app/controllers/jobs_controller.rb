class JobsController < ApplicationController
  before_action :logged_in_user, only: [:new]

  def index
    @jobs = Job.where(status: "active")
    @tags = TagName.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    if current_user
      if current_user.has_business?
        redirect_to new_business_admin_job_path
      else
        flash[:danger] = "Must have a business to register a new job
        opportuntity"
        redirect_to new_business_path
      end
    else
      binding.pry
      redirect_to login_path
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :benefits)
  end

  def address_params
    params[:job].require(:address).permit(:street, :unit, :city, :state, :zip)
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
end
