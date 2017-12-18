module TweetsHelper
  def convert_to_datetime scheduled_at
    DateTime.strptime(scheduled_at, '%m/%d/%Y %I:%M %p %z')
  end

  # https://twitter.com/133952012/status/942654918795464704
  def tweet_url tweet
    "https://twitter.com/#{tweet.user.uid}/status/#{tweet.tid}"
  end
end
