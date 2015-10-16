require "rails_helper"

RSpec.feature "User signs up" do
  context "an unauthenticated user" do
    scenario "signs up and is saved" do
      visit signup_path
      fill_in("full_name", with: "Matt H")
      fill_in("Email", with: "matt@example.com")
      fill_in("Display Name", with: "Matt")
      click_on "Create Account"

      expect(current_path).to eq(profile_path)
      expect(page).to have_content("Matt H")
      expect(page).to have_content("matt@example.com")
    end
  end
end
