
# TODO: Post cat image using http://www.rubydoc.info/gems/twitter/Twitter%2FREST%2FTweets%3Aupdate_with_media

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
    @tweet = Tweet.new
    @tweet.scheduled_at = convert_to_datetime(params[:tweet][:scheduled_at])
    @tweet.user = current_user

    if @tweet.update_attributes(permitted_params)
      flash[:notice] = "Tweet scheduled successfully!"
      redirect_to user_tweets_path(current_user)
    else
      flash[:alert] = "Failed to schedule Tweet"
      render "new"
    end

  end

  def permitted_params
    params.require(:tweet).permit(:tweet)
  end
  private :permitted_params

end
