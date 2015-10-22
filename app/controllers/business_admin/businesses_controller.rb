class BusinessAdmin::BusinessesController < BusinessAdminController
  def show
    @business = current_user.business
    @statuses = Job.pluck(:status).uniq
    @jobs = @business.jobs
  end

  def edit
    @business = current_user.business
    if @business.addresses.first
      @address = @business.addresses.first
    else
      @address = Address.new
    end
  end

  def update
    business = current_user.business
    if business.update(business_params)
      business.addresses.find_or_create_by(address_params)
      flash[:success] = "Successfully registered business"
      redirect_to business_admin_path
    else
      flash[:errors] = "Invalid paremeters"
      render :new
    end
  end

  private

  def business_params
    params.require(:business).permit(:name, :about)
  end

  def address_params
    params[:business].require(:address).permit(:street, :unit, :city, :state,
      :zip)
  end

end
