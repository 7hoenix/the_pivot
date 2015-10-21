class ResumesController < ApplicationController
  def new
    @resume = Resume.new
    @repositories = current_client.reposoitories(current_user.nickname).map { |repo| repo[:name] }
  end
end
