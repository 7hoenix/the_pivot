class JobApplication < ActiveRecord::Base
  belongs_to :resume
  belongs_to :job
  belongs_to :user
end
