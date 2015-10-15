require "rails_helper"

RSpec.feature "Unauthenticated user browses jobs" do

  context "unauthenticated user" do
    scenario "can browse the jobs" do
      create(:job)
      visit "/jobs"
      expect(current_path).to eq(jobs_path)
      expect(page).to have_content("Jr dev")
    end

    scenario "can view an individual job" do
      create(:job)
      visit "/jobs"
      click_on "Jr dev"
      expect(page).to have_content("Write some code")
    end
  end
end
