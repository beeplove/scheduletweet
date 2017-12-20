require 'rails_helper'

RSpec.describe Tweet, type: :model do
  let (:tweet) { FactoryBot.build(:tweet) }

  describe "#save" do
    it "saves tweet in the database" do
      user = tweet.user
      tweet = Tweet.new (attributes_for(:tweet))
      tweet.user = user
      tweet.save!
      expect(tweet.new_record?).to be_falsey
    end

    it "should require tweet "
  end
end
