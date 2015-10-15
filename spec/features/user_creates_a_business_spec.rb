require "rails_helper"

def log_in
  visit "/login"
  fill_in("session[email]", with: @user.email)
  fill_in("session[password]", with: @user.password)
  click_button "Login"
end

RSpec.feature "User creates a business" do
  context "after logging in" do
    before(:each) do
      @user = create(:user)
    end
    scenario "and is redirected to their business dashboard" do
      visit root_path
      click_on "Post a Job"
      expect(current_path).to eq(login_path)

      log_in
      expect(current_path).to eq(new_business_path)
      fill_in("Name", with: "Pivotal Labs")
      fill_in("About", with: "Business Consultancy")
      click_on "Register Business"

      expect(current_path).to eq(company_dashboard_path)
      expect(page).to have_content("Pivotal Labs")
      expect(page).to have_content("Business Consultancy")
    end
  end
end
