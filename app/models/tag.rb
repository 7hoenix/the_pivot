class Tag < ActiveRecord::Base
  validates :tag_name_id, :tagable_id, :tagable_type, presence: true
  validates :tag_name_id, presence: true
  belongs_to :taggable, polymorphic: true
  belongs_to :tag_name
end
