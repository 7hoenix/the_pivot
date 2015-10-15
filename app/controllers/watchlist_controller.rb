class WatchlistController < ApplicationController
  def create
    @current_watchlist.add_job(params[:job_id])
    session[:watchlist] = @current_watchlist.watchlist_jobs
    redirect_to watchlist_path
  end

  def delete
    @current_watchlist.delete_job(params[:format])
    redirect_to watchlist_path
  end

  def update
    if params[:quantity] == "increase"
      @current_watchlist.increase_job_quantity(params[:job_id])
      redirect_to user_path
    elsif params[:quantity] == "decrease"
      @current_watchlist.decrease_job_quantity(params[:job_id])
      redirect_to user_path
    end
  end
  def index
    redirect_to root_path
  end
end
