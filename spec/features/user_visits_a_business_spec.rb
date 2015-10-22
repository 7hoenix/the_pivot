require "rails_helper"
require 'pry'

RSpec.feature "User visits a business" do
  context "after logging in" do
    before(:each) do
      @user = create(:user)
      @user2 = create(:user)
      @business = create(:business)
      @user2.business = @business
    end

    scenario "and follows the slug path to get there" do
      @business.addresses << create(:address)
      visit "/#{@business.slug}"

      expect(current_path).to eq("/#{@business.slug}")
      expect(page).to have_content(@business.name)
      expect(page).to have_content(@business.about)
    end
  end

  context "but types in the wrong slug" do
    before(:each) do
      @user = create(:user)
      @business = create(:business, user_id: @user.id)
    end
    scenario "and is redirected to a 404 page" do
expect { visit "/pivotallabs" }.to raise_error(ActionController::RoutingError)
    end
  end
end
