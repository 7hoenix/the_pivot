class SessionHandler
  attr_accessor :flash_notice, :path, :user
  def initialize(session=nil, params=nil)
    @session      = session
    @params       = params
    @flash_notice = ""
    @path         = ""
    @user         = nil
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
