require "rails_helper"

RSpec.feature "business has an address" do
  include IntegrationSpecHelper
  context "when it is created" do
    scenario "by a user" do
      login_with_oauth

      visit new_business_path
      fill_in("Name", with: "Pivotal Labs")
      fill_in("About", with: "Custom software for peeps.")
      fill_in("Street", with: "1644 Platte st")
      fill_in("City", with: "Denver")
      fill_in("State", with: "CO")
      fill_in("Zip", with: "80202")
      click_on "Register Business"

      expect(current_path).to eq(business_admin_path)
      expect(page).to have_content("Pivotal Labs")
      expect(Business.last.addresses.last.full_address).to eq("1644 Platte st Denver, CO 80202")
    end
  end
end
