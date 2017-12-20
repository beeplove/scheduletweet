class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate
    if ! authenticated?
      flash[:alert] = "Please login to access that page"
      redirect_to root_path
    end
  end
  private :authenticate
  helper_method :authenticate

  def authenticated?
    !!current_user
  end
  private :authenticated?
  helper_method :authenticated?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  rescue ActiveRecord::RecordNotFound
    # in case of corrupted session, it might be out of sync with database
    session[:user_id] = nil
    @current_user = nil
  end
  private :current_user
  helper_method :current_user

end
