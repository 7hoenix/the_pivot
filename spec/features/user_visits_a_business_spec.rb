require "rails_helper"

def log_in
  visit "/login"
  fill_in("session[email]", with: @user.email)
  fill_in("session[password]", with: @user.password)
  click_button "Login"
end

RSpec.feature "User visits a business" do
  context "after logging in" do
    before(:each) do
      @user = create(:user)
      @user2 = create(:user, full_name: "Matt Hecker", email: "matt@example.com", password: "password")
      @business = create(:business, user_id: @user2.id)
    end
    scenario "and follows the slug path to get there" do
      log_in
      visit "/pivotal-labs"
      expect(current_path).to eq(businesses_show_path)
      expect(page).to have_content("Pivotal Labs")
      expect(page).to have_content("Business Consultancy")
    end
  end
end
