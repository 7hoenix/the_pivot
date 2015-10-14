class Admin::JobsController < AdminController

  def index
    if current_user.nil? || current_user.user?
      redirect_to root_path, alert: "Sensei says: 'Not quite yet young grasshopper'"
    else
      @jobs = Job.all
    end
  end

  def edit
    if current_user.nil? || current_user.user?
      redirect_to root_path, alert: "Sensei says: 'Not quite yet young grasshopper'"
    else
      @job = Job.find(params[:id])
      @categories = @job.categories
      render :edit
    end
  end

  def new
    if current_user.nil? || current_user.user?
      redirect_to root_path, alert: "Sensei says: 'Not quite yet young grasshopper'"
    else
      @job = Job.new
      @categories = Category.all
    end
  end

  def create
    if current_user.nil? || current_user.user?
      redirect_to root_path, alert: "Sensei says: 'Not quite yet young grasshopper'"
    else
      @job = Job.new(job_params)

      @categories = params.select{ |k,v| k.include?("ItemsCategory") }.values[0].select{ |k,v| v == "1" }.keys

      if @job.save
        @categories.each do |category|
          @job.jobs_categories.create(category_id: Category.find_by(title: category).id)
        end
        redirect_to admin_jobs_path
      else
        render :new
      end
    end
  end

  def update
    @job = Job.find(params[:id])
    @job.retired!
    redirect_to admin_jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :price, :picture)
  end

end
