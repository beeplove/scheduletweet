class CreateTweets < ActiveRecord::Migration[5.1]
  def change
    create_table :tweets do |t|
      t.references :user
      t.string :tweet, limit: 280
      t.datetime :scheduled_at
      t.timestamps
    end
  end
end
