require 'rails_helper'

RSpec.describe Job, :type => :model do
  before(:each) do
    @job = create(:job)
  end

  context "with valid attributes" do
    it "is valid" do
      expect(@job).to be_valid
    end
  end

  context "with invalid attributes" do
    it "is invalid without a title" do
      @job.title = nil

      expect(@job).to be_invalid
    end

    it "is invalid without a description" do
      @job.description = nil

      expect(@job).to be_invalid
    end

    it "attaches a number of  tags to itself" do

      tag1 = TagName.create(name: "first tag", color: "color1")
      tag2 = TagName.create(name: "second tag", color: "color2")
      tag3 = TagName.create(name: "third tag", color: "color2")
      @job.load_tags([tag1.id, tag2.id, tag3.id])

      expect(@job.tags.count).to eq(3)
    end

  end
end
