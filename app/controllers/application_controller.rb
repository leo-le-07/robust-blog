class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def deny_anonymous_user
  end

  def deny_signed_in_user
  end

  private
  	def current_user
  		@current_user ||= User.find(session[:user_id]) if session[:user_id]
  	end
end
