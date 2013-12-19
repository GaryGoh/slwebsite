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

  def faq
  end

  def about
  end

  def news
    @issues = Issue.all
  end

  def background_params
    params.require(:home_background).permit(:ava_pic)
  end

end


