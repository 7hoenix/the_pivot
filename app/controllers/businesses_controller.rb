class BusinessesController < ApplicationController
  def new
    @business = Business.new
  end

  def show
    @business = Business.find(params[:id])
  end

  def create
    business = Business.new(business_params)
    if business.save
      flash[:success] = "Successfully registered business"
      redirect_to company_dashboard_path(id: business.id)
    else
      flash[:errors] = "Invalid paremeters"
      render :new
    end
  end

  private

  def business_params
    params.require(:business).permit(:name, :about, :slug, :user_id)
  end
end
