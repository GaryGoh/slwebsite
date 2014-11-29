class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #layout "2_split"
  protect_from_forgery
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
    #@issues = Issue.all.order("created_at DESC")
    #@issues = Issue.order("created_at DESC").find(:all,
    #                                              :joins => "LEFT OUTER JOIN notis ON notis.created_at = issues.created_at")
    #
    #@notis = Noti.order("created_at DESC").find(:all,
    #                                            :joins => "LEFT OUTER JOIN issues ON issues.created_at = notis.created_at")
    #
    #@inners = Issue.order("created_at DESC").find(:all,
    #                                                 :joins => "INNER JOIN notis ON notis.created_at = issues.created_at")
    #
    #@last_news = Issue.order("created_at DESC").find(:all,
    #                                                 :joins => "LEFT OUTER JOIN notis ON notis.created_at = issues.created_at")
    #@notis = Noti.all.order("created_at DESC")
    @issues = Issue.all.order("created_at ASC")
    @notis = Noti.all.order("created_at DESC")

    @last_news = @notis + @issues


    #@last_news.each do |l|


  end


  #end


  # It caused ActiveAdmin paginate scope bug.
  #@societies = Society.where(:is_outstanding => true)
  #@societies_gy = @societies.where(:department_id => 1)
  #@societies_wy = @societies.where(:department_id => 2)
  #@societies_xs = @societies.where(:department_id => 3)
  #@societies_ty = @societies.where(:department_id => 4)

  #@topnews = Issue.where(:category_id => 1).last(4).reverse
end