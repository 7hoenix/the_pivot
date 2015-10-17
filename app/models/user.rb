class User < ActiveRecord::Base
  enum role: %w(user admin)
  has_many :orders
  has_one :business

  def has_business?
    return true if business
  end

  def self.find_or_create_by_oauth(oauth)
    user = User.find_or_create_by(provider: oauth.provider, uid: oauth.uid)

    user.email = oauth.info.email
    user.image_url = oauth.info.image
    user.token = oauth.credentials.token
    user.save

    user
  end
end
