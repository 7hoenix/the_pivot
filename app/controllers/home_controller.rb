class HomeController < ApplicationController
  def show
  end

  def index
    render layout: "landing_page"
  end
end
