require "rails_helper"

RSpec.describe TagName, type: :model do
  it "is only valid with correct attributes" do
    tag_name = build(:tag_name)

    expect(tag_name).to be_valid

    tag_name.name = nil

    expect(tag_name).to be_invalid
  end
end
