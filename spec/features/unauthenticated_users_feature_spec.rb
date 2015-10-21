require "rails_helper"

RSpec.feature "Unauthenticated user browses jobs" do

  context "unauthenticated user" do
    scenario "can browse the jobs" do
      job = create(:job)
      visit "/jobs"
      expect(current_path).to eq(jobs_path)
      expect(page).to have_content(job.title)
    end

    scenario "can view an individual job" do
      job =create(:job)
      visit "/jobs/#{job.id}"
      expect(page).to have_content(job.description)
    end

    scenario "can view an individual job" do
      job =create(:job)
      visit "/jobs/"
      within(first(".job")) do
        click_link_or_button "Watch This Job"
      end
      expect(page).to have_content(job.description)
    end

    scenario "is asked to login before trying to create a job" do
      job = create(:job)
      visit "/jobs/new"
      expect(page).to have_content("Profile")
    end
  end
end
