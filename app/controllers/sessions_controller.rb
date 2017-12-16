class SessionsController < ApplicationController

  def create
    user = User.from_omniauth(request.env['omniauth.auth'])
    redirect_to "/"
  end

end