require "rails_helper"

RSpec.feature "Admin can view site dashboard" do
  include IntegrationSpecHelper
  context "when logged in as admin" do
    scenario "can see full list of tag_names" do
      @user     = create(:user, role: 1)
      login_with_oauth

      visit admin_path

      expect(current_path).to eq(admin_path)
    end
  end
end
