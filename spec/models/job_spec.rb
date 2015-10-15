require 'rails_helper'

RSpec.describe Job, :type => :model do
  context "with valid attributes" do
    it "is valid" do
      job = Job.create(title: "Developer", description: "Develop things for our company")
      expect(job).to be_valid
    end
  end
  context "with invalid attributes" do
    it "is invalid without a title" do
      job = Job.create(title: nil, description: "Do work")
      expect(job).to be_invalid 
    end
  end
end
