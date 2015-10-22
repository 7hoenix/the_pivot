require "rails_helper"

RSpec.feature "Business admin can edit business" do
  include IntegrationSpecHelper
  context "when logged in as business admin" do
    scenario "the business is updated" do
      @user = create(:user)
      @business = create(:business, user_id: @user.id)
      login_with_oauth

      visit business_admin_path
      click_on "Edit Business Information"
      fill_in("About", with: "Makes good coffee")
      click_on "Edit Business"

      expect(current_path).to eq(business_admin_path)
      expect(page).to have_content("Makes good coffee")
    end
  end
end
