require "rails_helper"

RSpec.describe Business, type: :model do
  context "Business has valid attributes" do
    it "is valid" do
      business = create(:business)

      expect(business).to be_valid
    end
  end

  context "invalid attributes" do
    it "is invalid without a name" do
      business = create(:business, name: nil)

      expect(business).to_not be_valid
    end
  end
end
