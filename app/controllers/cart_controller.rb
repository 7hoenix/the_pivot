class CartController < ApplicationController
  def create
    @current_cart.add_job(params[:job_id])
    session[:cart] = @current_cart.cart_items
    redirect_to cart_path
  end

  def delete
    @current_cart.delete_job(params[:format])
    redirect_to cart_path
  end

  def update
    if params[:quantity] == "increase"
      @current_cart.increase_job_quantity(params[:job_id])
      redirect_to cart_path
    elsif params[:quantity] == "decrease"
      @current_cart.decrease_job_quantity(params[:job_id])
      redirect_to cart_path
    end
  end
end
