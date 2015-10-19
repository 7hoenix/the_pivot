require "rails_helper"

RSpec.describe User, :type => :model do
  context "valid attributes" do
    it "is valid" do
      user = build(:user)
      expect(user).to be_valid
    end
  end

  # it "loads watched jobs" do
  #   user = create(:user)
  #   watched_jobs = [1,4,2,5]
  #   user.l
  # end
end
