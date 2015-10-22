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
      tag_name = create(:tag_name)
      job.tags << create(:tag, tag_name_id: tag_name.id)

      visit "/profile"
      click_link_or_button "Edit Tags/Profile"
      check "user[tag_ids][]"
      click_link_or_button "Update preferences"

      expect('.watchlist').not_to have_content(job.title)
      expect(page).to have_content(job.title)

    end
  end
end
