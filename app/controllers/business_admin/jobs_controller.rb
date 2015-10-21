class BusinessAdmin::JobsController < BusinessAdminController
  def new
    if current_user.has_business?
      @job = Job.new
      @tags = TagName.all
      @address = Address.new
    else
      flash[:danger] = "Must have a business to register a new job
      opportuntity"
      redirect_to new_business_path
    end
  end

  def create
    job = current_user.business.jobs.new(job_params)
    job.load_tags(job_params[:tag_ids])
    if job.save
      job.address = Address.find_or_create_by(address_params)
      redirect_to jobs_path
    else
      flash[:errors] = "Job not created"
      render :new
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :benefits, tag_ids: [])
  end

  def address_params
    params[:job].require(:address).permit(:street, :unit, :city, :state, :zip)
  end
end
