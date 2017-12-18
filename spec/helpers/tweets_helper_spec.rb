require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the TweetsHelper. For example:
#
# describe TweetsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end


RSpec.describe TweetsHelper, type: :helper do
  describe "tweet_url" do
    it "returns url for the tweeter post" do
      tweet = double("Tweet")
      allow(tweet).to receive_message_chain(:user, :uid) { "1234" }
      allow(tweet).to receive(:tid) { "1234567890" }

      expect(tweet_url(tweet)).to eq("https://twitter.com/1234/status/1234567890")
    end
  end

  describe "convert_to_datetime" do
    it "returns a datetime object" do
      scheduled_at = "12/18/2017 10:43 AM -0800"
      expect(convert_to_datetime(scheduled_at)).to eq("Mon, 18 Dec 2017 10:43:00 -0800")
    end
  end
end
