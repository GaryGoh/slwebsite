class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper


  #rescue_from CanCan::AccessDenied do |exception|
  def access_denied(exception)
    redirect_to admin_dashboard_path, :alert => exception.message
  end
  #
  def current_ability
    @current_ability ||= Ability.new(current_admin_user)
  end



end
