class Tag < ActiveRecord::Base
  validates :tag_name_id, :taggable_id, :taggable_type, presence: true
  validates :tag_name_id, presence: true
  belongs_to :taggable, polymorphic: true
  belongs_to :tag_name
end
