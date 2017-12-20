class Tweet < ApplicationRecord
  belongs_to :user

  validates :tweet, presence: { message: "Tweet can't be empty" }
  validates :tweet, length: { maximum: 280, message: "Tweet can't be more than 280 characters" }
  validate  :scheduled_at, :validates_scheduled_at_in_future_time


  def validates_scheduled_at_in_future_time
    if scheduled_at.nil?
      errors.add(:scheduled_at, "Scheduled time can't be empty")
    elsif Time.now > scheduled_at
      errors.add(:scheduled_at, "Scheduled at can't be in past")
    end
  end
end
