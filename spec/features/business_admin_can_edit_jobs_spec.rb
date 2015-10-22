require "rails_helper"

RSpec.feature "Business admin can edit jobs" do
  include IntegrationSpecHelper
  context "when logged in as business admin" do
    scenario "the job is updated" do
      @user     = create(:user)
      @business = create(:business, user_id: @user.id)
      @job      = create(:job, business_id: @business.id)
      login_with_oauth

      visit business_admin_path
      click_on "Edit Job"
      fill_in("Title", with: "Coffee maker")
      click_on "Update Job"

      expect(current_path).to eq(business_admin_path)
      expect(page).to have_content("Coffee maker")
    end
  end
end
