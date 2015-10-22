class Resume < ActiveRecord::Base
  validates :title, presence: true
  has_many :resume_repositories
  has_many :repositories, through: :resume_repositories
  belongs_to :user
  has_many :job_applications
end
