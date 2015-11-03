class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action Proc.new{ authenticate_enterprise! if params[:controller] =~ /^zhao|^song/ }
  before_action Proc.new{ authenticate_admin! if params[:controller] =~ /^admin/ }
end
