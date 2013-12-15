class StaticPageController < ApplicationController

  def home
    @issues_school = Issue.where('category_id = 1').last(5).reverse
    @issues_sl = Issue.where('category_id = 2').last(5).reverse
    @issues_notice = Issue.where('category_id = 3').last(5).reverse
  end

  def faq
  end

  def about
  end

  def news
    @issues = Issue.all
  end
end


