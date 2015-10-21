class Repository < ActiveRecord::Base
  has_many :resume_repositories
  has_many :resumes, through: :resume_repositories
end
