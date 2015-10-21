class Resume < ActiveRecord::Base
  has_many :resume_repositories
  has_many :repositories, through: :resume_repositories
  belongs_to :user
end
