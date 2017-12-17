class SessionsController < ApplicationController

  def create
    user = User.from_omniauth(request.env['omniauth.auth'])
    redirect_to user_tweets_path(user)
  end

end