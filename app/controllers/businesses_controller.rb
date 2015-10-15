class BusinessesController < ApplicationController

  def new
    @business = Business.new
  end

  def show
    @business = Business.find_by(slug: params[:slug]) or render_404
  end

  def create
    current_user.business = Business.new(business_params)
    business = current_user.business
    if business.save
      flash[:success] = "Successfully registered business"
      redirect_to company_dashboard_path(slug: business.slug)
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
