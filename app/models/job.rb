class Job < ActiveRecord::Base
  validates :title, :description, presence: true

  has_many :orders
  has_many :items_categories
  has_many :categories, :through => :items_categories
  enum status: %w(active retired)
end