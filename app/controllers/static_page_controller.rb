class StaticPageController < ApplicationController
  layout "index", only: [:index]


def home
    @issues_school = Issue.where('category_id = 1').last(5).reverse
    @issues_sl = Issue.where('category_id = 2').last(5).reverse
    @issues_notice = Issue.where('category_id = 3').last(5).reverse
    @backgrounds = HomeBackground.limit(3).find(:all, :order => "created_at DESC")
    @background_active = @backgrounds.first
    @backgrounds_standby = @backgrounds.last(2)

  end

  def index
    # Index top news
    @issues_index = Issue.limit(8).find(:all, :order => "created_at DESC")
    @topnews = Issue.where('category_id = 1').last(6).reverse
    @normnews = Issue.where('category_id = 1').first(6).reverse

    # Index societies, solved ActiveAdmin paginate scope bug
    @societies = Society.where(:is_outstanding => true)
    @societies_gy = @societies.where(:department_id => 1)
    @societies_wy = @societies.where(:department_id => 2)
    @societies_xs = @societies.where(:department_id => 3)
    @societies_ty = @societies.where(:department_id => 4)

    # Index issues
    @issues = Issue.search(params[:search])
    @issues_top = Issue.joins(:category).where(:categories => {:category_name => "顶置新闻"}).last(6).reverse
    @issues_society = Issue.joins(:category).where(:categories => {:category_name => "社团新闻"}).last(4).reverse
    @issues_school = Issue.joins(:category).where(:categories => {:category_name => "学校新闻"}).last(10).reverse
    @issues_global = Issue.joins(:category).where(:categories => {:category_name => "世界时事"}).last(6).reverse

    # Index notis
    @notis = Noti.search(params[:search])
    @notis_activity = Noti.where(:category_id => 11).last(5).reverse
    @notis_info = Noti.where(:category_id => 12).last(5).reverse
    @notis_good = Noti.where(:category_id => 13).last(5).reverse


    # Index Download
    @materials = Material.all.reverse

  end



  def about
  end

  def news
    @issues = Issue.all
    respond_to do |format|
      format.html
      format.js
    end

  end

  def background_params
    params.require(:home_background).permit(:ava_pic)
  end

end


