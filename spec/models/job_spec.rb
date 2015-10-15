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
  end
end
