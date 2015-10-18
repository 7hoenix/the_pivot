class BusinessAdminController < ApplicationController
  before_action :verify_user

  def verify_user
    if !current_user
      flash[:danger] = "Log in to post a new job"
      redirect_to login_path
    end
  end
end
