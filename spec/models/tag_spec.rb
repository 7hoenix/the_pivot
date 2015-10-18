require "rails_helper"

RSpec.describe Tag, type: :model do
  it "it exists" do
    tag = create(:tag)

    expect(tag).to be_valid
  end

  it "is only valid with correct attributes" do
    tag = build(:tag)

    expect(tag).to be_valid

    tag.tag_name = nil
    expect(tag).to be_invalid
  end

  it "can have many jobs" do
    tag = create(:tag)
    job = create(:job)
    job.tags << tag

    expect(job.tags).to include(tag)
  end

  it "can have many users" do
    tag = create(:tag)
    user = create(:user)
    user.tags << tag

    expect(user.tags).to include(tag)
  end
end
