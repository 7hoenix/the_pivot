class Job < ActiveRecord::Base
  validates :title, :description, presence: true
  belongs_to :business
  has_one :address, as: :addressable
  has_many :tags, as: :taggable
  has_many :tag_names, through: :tags
  has_many :watched_jobs
  has_many :watchers, through: :watched_jobs, source: :user
  has_many :job_applications

  has_many :orders
  has_many :items_categories
  has_many :categories, :through => :items_categories

  scope :active, -> { where(status: "active") }

  def load_tags(tag_name_ids)
    if tag_name_ids.class == Array
      tag_name_ids.each do |tag_name_id|
        Tag.find_or_create_by(taggable_id: id, taggable_type: "Job", tag_name_id: tag_name_id)
      end
    end
  end

  def short_desc
    "#{description.first(90)} ..."
  end

  def location
    "#{self.address.city} #{self.address.state}"
  end
end
