require "rails_helper"

RSpec.describe WatchList, type: :model do
  context "an job is added to the watchlist" do
    it "with valid attributes" do
      job = create(:job)
      watchlist = WatchList.new(nil)
      watchlist.add_job(job)
      expect(watchlist.watchlist_items.count).to eq(1)
      job2 = Job.create
      watchlist.add_job(job2)
      expect(watchlist.watchlist_items.count).to eq(2)
    end
  end
end
