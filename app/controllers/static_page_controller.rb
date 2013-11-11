class StaticPageController < ApplicationController

  def home
  end

  def faq
  end

  def about
  end

  def news
    @issues = Issue.all
  end
end


