class User < ActiveRecord::Base
  has_secure_password
  validates :password, :full_name, :email, presence: true
  enum role: %w(user admin)
  has_many :orders

  def has_business?
    return true if current_user.business
  end
end
