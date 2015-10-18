class HomeController < ApplicationController
  def show
  end

  def contact
  end

  def about
  end

  def index
    render layout: "landing_page"
  end
end
