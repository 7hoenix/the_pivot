require "rails_helper"

RSpec.feature "Authenticated user", type: :feature do
  include IntegrationSpecHelper
  context "is logged in" do

    scenario "can log out" do
      login_with_oauth
      save_and_open_page
      click_link_or_button 'Log out'


      expect(current_path).to eq(root_path)
      expect(@current_user).to eq(nil)
    end

    scenario "cannot view the administrator screens" do
      visit '/admin'

      expect(page).to_not have_content('admin')
    end
  end
end
