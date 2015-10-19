class User < ActiveRecord::Base
  enum role: %w(user admin)
  has_many :orders
  has_one :business
  has_many :tags, as: :taggable
  has_many :tag_names, through: :tags


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

  def load_watched_jobs(watched_jobs)
    watched_jobs.each do |watched_job|
      WatchedJob.find_or_create_by(user_id: id)
    end
  end
end
