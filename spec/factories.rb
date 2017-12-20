FactoryBot.define do

  factory :user do
    name "John Smith"
    provider "twitter"
    uid "134922012"
    token "RvMfR5usfNY9eNN1CzOwXY2C3o57VbmhEHiFmAwO"
    secret "S8z0oRUh9ApBNJIcyyaWBXrfAFHGrbAUDw4LQlUNhxpoZ"
  end

  factory :tweet do
    user
    tweet "Hello World!"
    scheduled_at "#{1.day.from_now.strftime('%m/%d/%Y %I:%M %p %z')}"
  end

end
