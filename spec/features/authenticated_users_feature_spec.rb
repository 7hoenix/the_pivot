require "rails_helper"

RSpec.feature "Authenticated user", type: :feature do
  context "is logged in" do
    let(:user) { User.create(full_name: "Stan Smith",
                             email: "stan@abc.com",
                             password: "password",
                             display_name: "Stan Smith")}
    before(:each) do
      visit '/login'
      fill_in('session[email]', with: user.email)
      fill_in('session[password]', with: user.password)
      click_button 'Login'
    end

    scenario "cannot log in" do
      visit '/login'
      expect(page).to have_content('Please Log out First')
    end

    scenario "can log out" do
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
