class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action Proc.new{ authenticate_user_zhao! if params[:controller] =~ /^zhao/ }
  before_action Proc.new{ authenticate_user_song! if params[:controller] =~ /^song/ }
  before_action Proc.new{ authenticate_user_admin! if params[:controller] =~ /^admin/ }
end
