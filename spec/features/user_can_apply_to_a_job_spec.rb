require "rails_helper"

RSpec.feature "User can apply to a job" do
  context "by submitting a resume" do
    scenario "to a job posting" do
      @user = create(:user)
      session[:user_id] = @user.id
      @business = create(:business)
      @job = create(:job, business_id: @business.id)
      @resume = create(:resume)

      visit profile_path
      click_on(@job.title)
      click_on("Apply")
      expect(page).to have_content(@business.full_address)

      select("Sweet resume", from: "Resumes")
      click_on("Submit Application")

      expect(current_path).to eq(profile_path)
      expect(page).to have_content("Open Applications: 1")
    end
  end
end
