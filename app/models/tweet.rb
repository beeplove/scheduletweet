class Tweet < ApplicationRecord
  belongs_to :user

  TWEET_MAX_LENGTH = 280

  validates :tweet, presence: { message: "Tweet can't be empty" }
  validates :tweet, length: { maximum: TWEET_MAX_LENGTH, message: "Tweet can't be more than #{TWEET_MAX_LENGTH} characters" }
  validate  :scheduled_at, :validates_scheduled_at_in_future_time


  def validates_scheduled_at_in_future_time
    if scheduled_at.nil?
      errors.add(:scheduled_at, "Scheduled time can't be empty")
    elsif id.nil? && Time.now > scheduled_at
      errors.add(:scheduled_at, "Scheduled at can't be in past")
    end
  end
end
