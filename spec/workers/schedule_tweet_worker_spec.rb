require 'rails_helper'

RSpec.describe ScheduleTweetWorker, type: :worker do
  describe "#perform" do
    let (:tweet) { FactoryBot.create(:tweet) }
    let (:worker) { ScheduleTweetWorker.new }


    it "posts tweet using Twitter::REST::Client#update" do
      twitter = double("Twitter")
      t = double("t")

      allow(Twitter::REST::Client).to receive(:new) { twitter }
      allow(twitter).to receive(:update) { t }
      allow(t).to receive(:id) { "1234567890" }

      post = worker.perform(tweet.id)

      expect(post.tid).to be_present
    end

  end
end
