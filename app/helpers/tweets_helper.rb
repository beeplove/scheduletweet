module TweetsHelper
  # takes a string representation of datetime from bootstrap-datetimepicker
  # and returns a datetime object
  def convert_to_datetime scheduled_at
    DateTime.strptime(scheduled_at, '%m/%d/%Y %I:%M %p %z')
  rescue ArgumentError
    nil
  end

  # returns link to the tweet on twitter
  # Example: https://twitter.com/133952012/status/942654918795464704
  def tweet_url tweet
    "https://twitter.com/#{tweet.user.uid}/status/#{tweet.tid}"
  end
end
