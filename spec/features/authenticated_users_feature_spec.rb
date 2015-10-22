require "rails_helper"

RSpec.feature "Authenticated user", type: :feature do
  include IntegrationSpecHelper
  context "is logged in" do

    scenario "can log out" do
      login_with_oauth
      click_link_or_button 'Log out'


      expect(current_path).to eq(root_path)
      expect(@current_user).to eq(nil)
    end

    scenario "cannot view the administrator screens" do
      visit '/admin'

      expect(page).to_not have_content('admin')
    end

    scenario "can edit user tags" do
      login_with_oauth

      visit '/profile/edit'
      expect(page).to have_content("Edit Profile:")
    end

    scenario "cannot create a new job without creating a business first" do
      login_with_oauth
      visit "/business_admin/jobs/new"
      expect(current_path).to eq(root_path)
    end
  end
end
