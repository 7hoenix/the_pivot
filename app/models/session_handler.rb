class SessionHandler
  attr_accessor :flash_notice, :path, :user
  def initialize(session, params)
    @session      = session
    @params       = params
    @flash_notice = ""
    @path         = ""
    @user         = nil
  end

  def apply_watched_jobs(user)
    @user = user
     if @session[:watchlist]
       @session[:watchlist].each do |job_id|
         user.watched_jobs <<  WatchedJob.new(job_id: job_id)
       end
       binding.pry
     end
  end

  def apply_user(user)
    @user = user
    if @user
      @session[:user_id] = @user.id
    else
      @flash[:notice] = "Invalid Login: try again"
    end
  end
end
