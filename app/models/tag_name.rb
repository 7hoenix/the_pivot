class TagName < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :tag
end
