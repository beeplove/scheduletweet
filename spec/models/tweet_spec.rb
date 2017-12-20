require 'rails_helper'

RSpec.describe Tweet, type: :model do
  let (:user) { FactoryBot.create(:user) }

  describe "#save" do
    it "saves tweet in the database" do
      tweet = Tweet.new (attributes_for(:tweet))
      tweet.user = user
      tweet.save
      expect(tweet.id).to be_present
    end

  end
end
