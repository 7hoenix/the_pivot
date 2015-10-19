class Tag < ActiveRecord::Base
  validates :tag_name_id, presence: true
  belongs_to :taggable, polymorphic: true
  belongs_to :tag_name

  def name
    tag_name.name
  end
end
