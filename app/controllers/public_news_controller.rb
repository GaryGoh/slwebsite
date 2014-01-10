class PublicNewsController < ApplicationController
  layout false, only: [:readmode]

  def allnews
    @issues = Issue.where('category_id = 1' || 'category_id = 2').reverse

  end

  def shownews
    @issue = Issue.find(params[:id])
    @issues = Issue.where('category_id = 1' || 'category_id = 2').reverse
  end

  def shownotis
    @noti = Noti.find(params[:id])
    @notifies = Noti.all.reverse
  end

  def readmode
    @issues = Issue.where('category_id = 1' || 'category_id = 2').reverse
  end

  def notifies
    @notifies = Noti.all.reverse
  end
end
