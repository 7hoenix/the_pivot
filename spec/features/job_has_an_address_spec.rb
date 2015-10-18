require "rails_helper"


RSpec.feature "Job has an address" do
  include IntegrationSpecHelper
  context "when it is created" do
    scenario "by a user with a business" do
      user = create(:user, uid: '12345', token: '12345')
      create(:business, user_id: user.id)

      login_with_oauth
      visit business_admin_path
      click_on "Post New Job"

      expect(current_path).to eq(new_job_path)
      fill_in("Title", with: "Jr Dev")
      fill_in("Description", with: "Make coffee every day")
      fill_in("Benefits", with: "PTO... lots of it")
      fill_in("Street", with: "1644 Platte st")
      fill_in("City", with: "Denver")
      fill_in("State", with: "CO")
      fill_in("Zip", with: "80202")
      click_on "Create Job"

      expect(current_path).to eq(jobs_path)
      expect(page).to have_content("Jr Dev")
      expect(page).to have_content("Make coffee every day")
      expect(page).to have_content("1644 Platte st Denver, CO 80202")
      expect(Job.last.address.full_address).to eq("1644 Platte st Denver, CO 80202")
    end
  end
end
