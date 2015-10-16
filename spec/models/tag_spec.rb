require "rails_helper"

RSpec.describe Tag, type: :model do
  it "it exists" do 
    tag = Tag.new
    expect(tag).to be_valid
  end
end
