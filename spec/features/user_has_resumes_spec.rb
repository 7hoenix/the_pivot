require "rails_helper"

RSpec.feature "User has resumes" do
  context "to choose from" do
    xscenario "after creating them" do
      @user = create(:user)
      session[:user_id] = @user.id

      visit profile_path
      click_on("Create New Resume")
      fill_in("Title", with: "Ruby Programmer")
      select("Repo1", from: "Repositories")
      click_on("Create Resume")

      expect(current_path).to eq(profile_path)
      expect(page).to have_content("Ruby Programmer")
    end
  end
end
