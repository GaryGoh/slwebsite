class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #layout "2_split"
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



  after_filter :store_location

  def store_location
# store last url as long as it isn't a /users path
    session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users/  || request.fullpath =~ /\/admin/
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end

  def after_update_path_for(resource)
    session[:previous_url] || root_path
  end


  def main_app
    Rails.application.class.routes.url_helpers
  end

end
