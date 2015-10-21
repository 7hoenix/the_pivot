class ResumeRepository < ActiveRecord::Base
  belongs_to :resume
  belongs_to :repository
end
