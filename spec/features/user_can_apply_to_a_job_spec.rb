require "rails_helper"

RSpec.feature "User can apply to a job" do
  include IntegrationSpecHelper
  context "by submitting a resume" do
    scenario "to a job posting" do
      @user = create(:user)
      @user.business = create(:business)
      @job = create(:job, business_id: @user.business.id)

      login_with_oauth

      visit profile_path
      click_on(@job.title)
      save_and_open_page
      click_on("Apply")
      expect(page).to have_content(@user.business.full_address)

      select("Sweet resume", from: "Resumes")
      click_on("Submit Application")

      expect(current_path).to eq(profile_path)
      expect(page).to have_content("Open Applications: 1")
    end
  end
end
