class Job < ActiveRecord::Base
  validates :title, :description, presence: true
  belongs_to :business
  has_one :address, as: :addressable
  has_many :tags, as: :taggable
  has_many :watched_jobs
  has_many :watchers, through: :watched_jobs, source: :user

  has_many :orders
  has_many :items_categories
  has_many :categories, :through => :items_categories

  scope :active, -> { where(status: "active") }
end
