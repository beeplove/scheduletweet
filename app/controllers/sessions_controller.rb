class SessionsController < ApplicationController

  def create
    user = User.from_omniauth(request.env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to user_tweets_path(user)
  end


  def destroy
    session[:user_id] = nil
    redirect_to "/"
  end
end
