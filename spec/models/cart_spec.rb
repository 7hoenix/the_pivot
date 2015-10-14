require "rails_helper"

RSpec.describe Cart, type: :model do
  context "an job is added to the cart" do
    it "with valid attributes" do
      job = create(:job)
      cart = Cart.new(nil)
      cart.add_job(job)
      expect(cart.cart_items.count).to eq(1)
      job2 = Job.create
      cart.add_job(job2)
      expect(cart.cart_items.count).to eq(2)
    end
  end
end
