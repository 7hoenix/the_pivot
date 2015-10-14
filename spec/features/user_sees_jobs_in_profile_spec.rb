require "rails_helper"

def log_in
  visit "/login"
  click_on "Login"
  fill_in("session[email]", with: @user.email)
  fill_in("session[password]", with: @user.password)
  click_on "Login"
end

RSpec.feature "A user" do
  context "is logged in" do
    before (:each) do
      @user = create(:user)
    end
    scenario "and sees a feed of all jobs" do
      job = create(:job)
      job2 = create(:job)
      log_in

      expect(page).to have_content(job.title)
      expect(page).to have_content(job2.title)
    end
  end
end
