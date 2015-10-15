class Business < ActiveRecord::Base
  belongs_to :user

  validates :slug, uniqueness: true, presence: true

  before_validation :generate_slug

  private

  def generate_slug
    self.slug = name.parameterize
  end
end
