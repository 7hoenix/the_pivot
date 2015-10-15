require 'rails_helper'

RSpec.describe Address, type: :model do
  describe "#full_address" do
    it "takes the elements of an address and puts them together" do
      address = create(:address)

      expect(address.full_address).to eq("1644 Platte st Denver, CO 80202")
    end
  end
end
