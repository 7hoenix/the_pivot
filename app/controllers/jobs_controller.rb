class JobsController < ApplicationController
  before_action :logged_in_user, only: [:new]

  def index
    active_business_ids = Business.online.pluck(:id)
    active_jobs = Job.where(business_id: active_business_ids).active
    @jobs = active_jobs.paginate(:page => params[:page], :per_page => 20)
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
