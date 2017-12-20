class Tweet < ApplicationRecord
  belongs_to :user

  validates :tweet, presence: true
  validates :tweet, length: { maximum: 280 }
  validates :scheduled_at, presence: true
end
