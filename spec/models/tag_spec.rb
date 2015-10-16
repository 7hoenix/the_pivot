require "rails_helper"

RSpec.describe Tag, type: :model do
  it "it exists" do 
    tag = create(:tag)

    expect(tag).to be_valid
  end

  context "valid attributes" do
    it "is only valid with correct attributes" do
      tag = Tag.new(name: "Ruby")
      
      expect(tag).to be_valid

      tag.name = nil

      expect(tag).to be_invalid
    end
  end
end
