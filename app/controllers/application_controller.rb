class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #layout "2_split"
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :set_gloable


  #rescue_from CanCan::AccessDenied do |exception|
  def access_denied(exception)
    redirect_to admin_dashboard_path, :alert => exception.message
  end
  #
  def current_ability
    @current_ability ||= Ability.new(current_admin_user)
  end



  def main_app
    Rails.application.class.routes.url_helpers
  end


  def set_gloable
    @notis_info = Noti.where(:category_id => 12).reverse

    # It caused ActiveAdmin paginate scope bug.
    #@societies = Society.where(:is_outstanding => true)
    #@societies_gy = @societies.where(:department_id => 1)
    #@societies_wy = @societies.where(:department_id => 2)
    #@societies_xs = @societies.where(:department_id => 3)
    #@societies_ty = @societies.where(:department_id => 4)

    #@topnews = Issue.where(:category_id => 1).last(4).reverse
  end
end
