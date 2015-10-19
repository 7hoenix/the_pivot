class User < ActiveRecord::Base
  enum role: %w(user admin)
  has_one :business

  has_many :orders
  has_many :tags, as: :taggable
  has_many :tag_names, through: :tags
  has_many :watched_jobs


  def has_business?
    return true if business
  end

  def self.find_or_create_by_oauth(oauth)
    user = User.find_or_create_by(provider: oauth.provider, uid: oauth.uid)

    user.nickname = oauth.info.nickname
    user.email = oauth.info.email
    user.image_url = oauth.info.image
    user.token = oauth.credentials.token
    user.github = oauth.info.urls.GitHub
    user.location = Octokit.user( user.nickname).location
    user.save

    user
  end

  def load_watched_jobs(job_ids)
    return false if !job_ids
    job_ids.each do |job_id|
      WatchedJob.find_or_create_by(user_id: id, job_id: job_id)
    end
  end

  def watched
    watched_jobs.map do |watched_job|
      watched_job.job
    end
  end
end
