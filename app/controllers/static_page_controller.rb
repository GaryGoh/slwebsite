class StaticPageController < ApplicationController

  def home
    @issues = Issue.last(5).reverse
  end

  def faq
  end

  def about
  end

  def news
    @issues = Issue.all
  end
end


