require "rails_helper"

RSpec.describe "User logs in" do

  context "with invalid log in credentials" do

    scenario "cannot log in without email or password" do
      visit "/login"
      click_button "Login"
      expect(page).to have_content("Invalid Login")
    end

    scenario "cannot log in without email" do
      visit "/login"
      fill_in("session[password]", with: "pass")
      click_button "Login"
        expect(page).to have_content("Invalid Login")
    end

    scenario "cannot log in without password" do
      visit "/login"
      fill_in("session[email]", with: "example@example.com")
      click_button "Login"
      expect(page).to have_content("Invalid Login")

    end
  end

  context "as a valid default user" do
    let(:user) { User.create(full_name: "dg",
                             email: "example@example.com",
                             password: "password",
                             display_name: "example name") }

    scenario "can log in" do
      visit "/login"
      fill_in("session[email]", with: user.email)
      fill_in("session[password]", with: user.password)
      click_button "Login"
      expect(page).to have_content("dg")
    end
  end

  context "as a valid admin" do
    let(:admin) { User.create(full_name: "dg",
                              email: "example@example.com",
                              password: "password",
                              display_name: "example name",
                              role: 1) }

    scenario "can log in" do
      visit "/login"
      fill_in("session[email]", with: admin.email)
      fill_in("session[password]", with: admin.password)
      click_button "Login"
      expect(page).to have_content("Welcome to the admin dashboard")
    end
  end
end
