class BusinessAdmin::JobsController < BusinessAdminController
  def new
    if current_user.has_business?
      @job = Job.new
      @tag_names = TagName.all
      @address = Address.new
    else
      flash[:danger] = "Must have a business to register a new job
      opportuntity"
      redirect_to new_business_path
    end
  end

  def create
    job = current_user.business.jobs.new(job_params)
    job.load_tags(job_params[:tag_name_ids])
    if job.save
      job.address = Address.find_or_create_by(address_params)
      redirect_to business_admin_path
    else
      flash[:errors] = "Job not created"
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
    @address = @job.address
  end

  def update
    @job = Job.find(params[:id])
    if params[:status] = "retired"
      @job.status = "retired"
      @job.save
      redirect_to business_admin_path
    else
      @job.update_attributes(job_params)
      redirect_to business_admin_path
    end
  end

  def destroy
    target = Job.find(params[:id])
    target.destroy
    redirect_to business_admin_path
  end

  private

  def job_params
    params.require(:job).permit(:status, :title, :description, :benefits, tag_name_ids: [])
  end

  def address_params
    params[:job].require(:address).permit(:street, :unit, :city, :state, :zip)
  end
end
