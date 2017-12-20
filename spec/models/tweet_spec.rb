require 'rails_helper'

RSpec.describe Tweet, type: :model do
  let (:tweet) { FactoryBot.build(:tweet) }
  let (:user) { tweet.user }

  describe "#save" do
    it "saves tweet in the database" do
      tweet = Tweet.new (attributes_for(:tweet))
      tweet.user = user
      tweet.save
      expect(tweet.new_record?).to be_falsey
    end

    it "should require tweet" do
      tweet.tweet = nil
      expect(tweet.valid?).to be_falsey
    end

    it "should require scheduled at time" do
      tweet.scheduled_at = nil
      expect(tweet.valid?).to be_falsey
    end

    it "raises error when scheduled at time is in past" do
      tweet.scheduled_at = 1.day.ago
      expect(tweet.valid?).to be_falsey
    end
  end
end
