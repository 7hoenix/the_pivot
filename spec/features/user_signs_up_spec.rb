require "rails_helper"

RSpec.feature "User signs up" do
  context "an unauthenticated user" do
    scenario "signs up and is saved" do
      visit signup_path
      save_and_open_page
      fill_in("user[full_name]", with: "Matt H")
      fill_in("user[email]", with: "matt@example.com")
      fill_in("user[display_name]", with: "Matt")
      fill_in("user[password]", with: "password")
      click_on "Create Account"

      expect(current_path).to eq(profile_path)
      expect(page).to have_content("Matt H")
      expect(page).to have_content("matt@example.com")
    end
  end
end
