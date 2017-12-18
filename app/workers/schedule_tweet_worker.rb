class ScheduleTweetWorker
  include Sidekiq::Worker

  def perform(tweet_id)
    # TODO: tweet on behalf of user
  end
end
