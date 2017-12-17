class TweetsController < ApplicationController

  before_action :authenticate

  def index
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(permitted_params)
    @tweet.user = current_user

    if @tweet.save
      redirect_to user_tweets_path(current_user)
    else
      render "new"
    end

  end

  def permitted_params
    params.require(:tweet).permit(:tweet, :scheduled_at)
  end
  private :permitted_params

end
