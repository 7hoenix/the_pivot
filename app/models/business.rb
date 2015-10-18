class Business < ActiveRecord::Base
  belongs_to :user
  has_many :jobs
  has_many :addresses, as: :addressable

  validates :name, uniqueness: true, presence: true
  validates :about, presence: true
  validates :slug, uniqueness: true, presence: true

  before_validation :generate_slug

  private

  def generate_slug
    self.slug = name.parameterize if name
  end
end
