class BusinessAdminDashboardPresenter
  attr_reader :user

  def initialize(user)
    @user = user
    user.business.image_url ||= Faker::Company.logo
    user.business.save
  end

  def business
    user.business
  end

  def statuses
    @statuses = Job.pluck(:status).uniq
  end

  def jobs
    business.jobs
  end

  def short_about
    business.about.first(255)
  end

  def business_image
    business.image_url
  end

  def primary_address
    business.addresses.first
  end

  def address_or_statement
    if primary_address
      primary_address.full_address
    else
      "No address on file"
    end
  end
end
