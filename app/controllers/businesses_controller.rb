class BusinessesController < ApplicationController

  def new
    @business = Business.new
    @address = Address.new
  end

  def show
    @business = Business.find_by(slug: params[:slug]) or render_404
    @jobs = @business.jobs
  end

  def create
    # New way
    business = current_user.build_business(business_params)

    if business.save
      business.addresses << Address.find_or_create_by(address_params)
      business.save
      flash[:success] = "Successfully registered business"
      redirect_to business_admin_path
    else
      flash[:errors] = "Invalid paremeters"
      render :new
    end
  end

  private

  def business_params
    params.require(:business).permit(:name, :about, :slug)
  end

  def address_params
    params[:business].require(:address).permit(:street, :unit, :city, :state,
      :zip)
  end
end
