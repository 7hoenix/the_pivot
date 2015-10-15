require 'rails_helper'

RSpec.describe Address, type: :model do
  describe "#full_address" do
    it "takes the elements of an address and puts them together" do
      address = create(:address)

      expect(address.full_address).to eq("1644 Platte st Denver, CO 80202")
    end
  end

  context "valid attributes" do
    it "Creates a new address" do
      address = build(:address)

      expect(address).to be_valid
    end
  end

  context "invalid attributes" do
    it "needs to have a street" do
      address = build(:address, street: nil)

      expect(address).to_not be_valid
    end
  end
end
