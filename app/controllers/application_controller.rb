class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  ## defining the following methods to track user status
  helper_method :current_user, :logged_in?
  ## preceding line allows all views to use these helper methods
  def current_user #return the current user if current user has already been called, 
  #otherwise return from session hash if session hash is not nil 
    @current_user ||= User.find(session[:user_id]) if session[:user_id] 
  end
  def logged_in?
    !!current_user # bang bang makes anythign a boolean, checks if anyone is logged in
  end
  def require_user
    if !logged_in? 
      flash.now[:danger] ="You must be logged in to perform that action"
    end
  end
end
