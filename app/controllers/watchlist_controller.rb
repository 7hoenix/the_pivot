class WatchlistController < ApplicationController
  def create
    if current_user
      current_user.load_watched_jobs([params[:job_id]])
    else
      if !session[:watchlist]
        session[:watchlist] = []
      end
      session[:watchlist] << params[:job_id].to_i
      session[:watchlist].uniq!
    end

    redirect_to profile_path
  end

  def delete
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
    redirect_to profile_path(current_user)
  end
end
