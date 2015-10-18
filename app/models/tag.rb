class Tag < ActiveRecord::Base
  belongs_to :taggable, polymorphic: true
  has_one :tag_name
end
