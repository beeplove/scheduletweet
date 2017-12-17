class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def authenticated?
    !!current_user
  end
  private :authenticated?
  helper_method :authenticated?


  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  private :current_user
  helper_method :current_user

end
