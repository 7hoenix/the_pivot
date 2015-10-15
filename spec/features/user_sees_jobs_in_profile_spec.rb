require "rails_helper"

def log_in
  visit "/login"
  fill_in("session[email]", with: @user.email)
  fill_in("session[password]", with: @user.password)
  click_button "Login"
end

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

    scenario "and sees a feed of jobs on their 'watchlist'" do
      job = create(:job)
      job2 = create(:job)
      log_in

      expect('.watchlist').not_to have_content(job.title)
      within(first('.job')) do
      	click_button('Watch This Job')
      end
      within(first(".job-listing-#{job2.title.parameterize}")) do
        click_button('Watch This Job')
      end
      save_and_open_page
      within('.watchlist') do
        expect(page).to have_content(job.title)
      end
    end
  end
end
