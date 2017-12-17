class CreateTweets < ActiveRecord::Migration[5.1]
  def change
    create_table :tweets do |t|
      t.belongs_to :user, index: true
      t.string :tweet, limit: 280
      t.datetime :scheduled_at
      t.timestamps
    end
  end
end
