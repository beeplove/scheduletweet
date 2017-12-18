gem 'twitter'

class ScheduleTweetWorker
  include Sidekiq::Worker

  def perform(tweet_id)
    tweet = Tweet.find(tweet_id)

    # TODO: Refactor by moving this chunk of code, this doesn't belong here.
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_KEY']
      config.consumer_secret     = ENV['TWITTER_SECRET']
      config.access_token        = tweet.user.token
      config.access_token_secret = tweet.user.secret
    end

    t = client.update(tweet.tweet)
    tweet.tid = t.id
    tweet.save!
  end
end
