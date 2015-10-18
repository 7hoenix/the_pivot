require "rails_helper"


RSpec.feature "User creates a business" do
  include IntegrationSpecHelper
  context "after logging in" do
    before(:each) do
      @user = create(:user)
    end
    scenario "and is redirected to their business dashboard" do
      visit root_path

      login_with_oauth
      click_on "Post a Job"

      expect(current_path).to eq(new_business_path)
      fill_in("Name", with: "Pivotal Labs")
      fill_in("About", with: "Business Consultancy")
      click_on "Register Business"

      expect(current_path).to eq(business_admin_path)
      expect(page).to have_content("Pivotal Labs")
      expect(page).to have_content("Business Consultancy")
    end
  end
end
