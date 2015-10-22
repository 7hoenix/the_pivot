class ResumesController < ApplicationController
  def new
    @resume = Resume.new
    @repositories ||= RepositoryHandler.new(current_client, current_user).populate_repositories
  end

  def create
    resume = current_user.resumes.new(resume_params)
    if resume.save
      resume_params[:repository_ids].each do |repository_id|
        ResumeRepository.find_or_create_by(resume_id: resume.id, repository_id:
          repository_id)
      end
      flash[:success] = "Resume created"
      redirect_back_or profile_path
    else
      flash[:errors] = "Resume not created"
      redirect_to new_resume_path
    end
  end

  def show
    @resume = Resume.find(params[:id])
    @repositories = @resume.repositories
  end

  private

  def resume_params
    params.require(:resume).permit(:title, repository_ids: [])
  end
end
