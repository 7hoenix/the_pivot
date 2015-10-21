require "rails_helper"


RSpec.feature "A user" do
  include IntegrationSpecHelper
  context "is logged in" do
    before (:each) do
      @user = create(:user)
      login_with_oauth
    end

    scenario "and sees a feed of jobs on their 'watchlist'" do
      job = create(:job)

      visit "/profile"

      expect('.watchlist').not_to have_content(job.title)
      within(first('.job')) do
      	click_button('Watch This Job')
      end

      within('.watchlist') do
        expect(page).to have_content(job.title)
      end
    end
  end
end
