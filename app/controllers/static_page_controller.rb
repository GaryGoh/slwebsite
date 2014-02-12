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
    @issues_index = Issue.limit(8).find(:all, :order => "created_at DESC")
    #@notifies = Issue.limit(5).find_by_category_id(3)
    #@topnews = Issue.limit(5).find_by_category_id(1)
    @topnews = Issue.where('category_id = 1').last(6).reverse
    @normnews = Issue.where('category_id = 1').first(6).reverse
    @societies = Society.where(:is_outstanding => true)


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


