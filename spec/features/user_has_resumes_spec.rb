require "rails_helper"

RSpec.feature "User has resumes" do
  include IntegrationSpecHelper
  context "to choose from" do
    xscenario "after creating them" do
      @user = create(:user)
      repository = create(:repository)
      create(:repository)
      login_with_oauth

      visit profile_path
      visit new_resume_path { @repositories = [repository, repsoitory2] }
      fill_in("Title", with: "Ruby Developer")
      save_and_open_page
      check(repository.full_name)
      click_on("Create Resume")

      expect(current_path).to eq(profile_path)
      expect(page).to have_content("Ruby Programmer")

      click_on("Ruby Programmer")
      expect(current_path).to eq(resume_path(Resume.last))
      expect(page).to have_content("My first project")
    end
  end
end
