require "rails_helper"

RSpec.describe BusinessAdminDashboardPresenter, type: :model do
  before(:each) do
    @user = create(:user)
    @business = create(:business, user_id: @user.id)
    create(:job, title: "justin", business_id: @business.id)
    create(:job, status: "filled", title: "justin2", business_id: @business.id)
    create(:job, status: "filled", title: "justin3", business_id: @business.id)
    @job = create(:job, status: "retired", title: "justin4", business_id: @business.id)
    @presenter = BusinessAdminDashboardPresenter.new(@user)
  end

  describe "#business" do
    it "returns its business" do
      expect(@presenter.business).to eq(@business)
    end
  end

  describe "#statuses" do
    it "returns all statuses" do
      statuses = ["active", "filled", "retired"]

      expect(@presenter.statuses).to eq(statuses)
    end
  end

  describe "#jobs" do
    it "returns the list of jobs associated with that business" do
      expect(@presenter.jobs.count).to eq(4)
      expect(@presenter.jobs.last).to eq(@job)
    end
  end
end
