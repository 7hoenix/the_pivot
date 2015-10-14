require "rails_helper"

RSpec.feature "A user" do
  context "is logged in" do
    before (:each) do
      @user = create(:user)
      visit "/login"
      click_button "Login"
      fill_in("session[email]", with: @user.email)
      fill_in("session[password]", with: @user.password)
      click_button "Login"
    end
    scenario "and sees a feed of all jobs" do
      job = create(:job)
      job2 = create(:job)
      visit "/profile"
      expect(page).to have_content(job.title)
      expect(page).to have_content(job2.title)
    end
  end
end
