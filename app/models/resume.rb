class Resume < ActiveRecord::Base
  validates :title, presence: true
  has_many :resume_repositories
  has_many :repositories, through: :resume_repositories
  has_attached_file :cover_letter, storage: :s3, s3_credentials: {:bucket => ENV["bucket"], :access_key_id => ENV["aws_key_id"], :secret_access_key => ENV["aws_secret_key"]}
  validates_attachment_content_type :cover_letter, content_type: /\Aapplication\/.*\Z/
  belongs_to :user
  has_many :job_applications
end
