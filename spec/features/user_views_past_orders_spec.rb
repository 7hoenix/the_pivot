require "rails_helper"

RSpec.describe "User views past orders" do
  context "with valid authorization" do
    let(:user) { User.create(full_name: "example",
                             email: "example@example.com",
                             password: "password",
                             display_name: "example name")}

  def login_and_submit_order
    visit "login"
    fill_in("session[email]", with: user.email)
    fill_in("session[password]", with: user.password)
    click_link_or_button "Login"
    create :item
    visit "/menu"
    click_button "Add To Cart"
    click_on "View Cart"
    click_link_or_button "Submit Order"
  end

    scenario "can see a past order" do
      login_and_submit_order
      click_link_or_button "View Past Orders"
      expect(page).to have_content("#{user.full_name}'s Orders")
      expect(page).to have_content("Order")
    end

    scenario "can view an individual order" do
      login_and_submit_order
      click_link_or_button "View Past Orders"
      click_link_or_button "View Order Details"
      expect(page).to have_content("Sushi")
    end

    scenario "can not view admin buttons" do
      login_and_submit_order
      click_link_or_button "View Past Orders"
      click_link_or_button "View Order Details"
      expect(page).to_not have_content("Mark As")
    end

    scenario "can see total order price" do
      visit "login"
      fill_in("session[email]", with: user.email)
      fill_in("session[password]", with: user.password)
      click_link_or_button "Login"
      create :item
      visit "/menu"
      click_button "Add To Cart"
      click_on "View Cart"
      click_link_or_button "+1"
      click_link_or_button "Submit Order"
      click_link_or_button "View Past Orders"
      click_link_or_button "View Order Details"
      expect(page).to have_content("$22.00")
    end
  end

end
