class TweetsController < ApplicationController
  include TweetsHelper

  before_action :authenticate

  def index
    @tweets = current_user.tweets
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(permitted_params)
    @tweet.scheduled_at = convert_to_datetime(params[:tweet][:scheduled_at])
    @tweet.user = current_user

    if @tweet.save
      after = @tweet.scheduled_at - Time.now
      ScheduleTweetWorker.perform_at(after.seconds, @tweet.id)
      flash[:notice] = "Tweet scheduled successfully!"
      redirect_to user_tweets_path(current_user)
    else
      render "new"
    end

  end

  def permitted_params
    params.require(:tweet).permit(:tweet)
  end
  private :permitted_params

end
