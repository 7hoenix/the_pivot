require "rails_helper"

RSpec.describe Item, type: :model do
  context "invalid attributes" do
    it "is invalid without any attributes" do
      item = Item.create
      expect(item).to_not be_valid
    end

    it "is invalid without a title" do
      item = build(:item, title: nil)
      expect(item).to_not be_valid
    end

    it "is invalid without a description" do
      item = build(:item, description: nil)
      expect(item).to_not be_valid
    end

    it "is invalid without a price" do
      item = build(:item, price: nil)
      expect(item).to_not be_valid
    end

  end

  context "valid attributes" do
    it "is given a default status of active" do
      item = build(:item)
      expect(item.status).to eq("active")
    end

    it "has categories" do
      item = build(:item, id: 5)
      item.save
      item.categories.create(id: 1, title: "apps", description: "before meal")
      expect(item.categories.first.title).to eq("apps")
    end

    it "has a picture" do

    end

  end

end


# Create item listings including a name, description, price, and upload a photo
