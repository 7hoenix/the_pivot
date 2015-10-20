require "rails_helper"

RSpec.feature "User has resumes" do
  context "to choose from" do
    xscenario "after creating them" do
      login_with_oauth

      visit profile_path
      click_on("Create New Resume")
      fill_in("Title", with: "Ruby Developer")
      select("Repo1", from: "Repositories")
      fill_in("Additional Information", with: "My first project")
      click_on("Create Resume")

      expect(current_path).to eq(profile_path)
      expect(page).to have_content("Ruby Programmer")

      click_on("Ruby Programmer")
      expect(current_path).to eq(resume_path(Resume.last))
      expect(page).to have_content("My first project")
    end
  end
end
