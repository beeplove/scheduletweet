module TweetsHelper
  def convert_to_datetime scheduled_at
    DateTime.strptime(scheduled_at, '%m/%d/%Y %I:%M %p %z')
  end
end
