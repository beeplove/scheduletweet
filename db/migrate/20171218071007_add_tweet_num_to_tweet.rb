class AddTweetNumToTweet < ActiveRecord::Migration[5.1]
  def change
    add_column :tweets, :tid, :string, after: :tweet

  end
end
