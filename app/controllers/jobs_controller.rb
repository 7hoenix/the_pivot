class JobsController < ApplicationController

  def index
    @jobs = Job.active
  end

  def post
  end

  def show
    @job = Job.find(params[:id])
  end

end
