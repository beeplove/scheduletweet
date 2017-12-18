class HomeController < ApplicationController

  def index
    redirect_to user_tweets_path(current_user) if authenticated?
  end
end
