class PublicNewsController < ApplicationController
  layout false, only: [:readmode]
  def allnews
    @issues = Issue.where('category_id = 1' || 'category_id = 2').reverse

  end

  def shownews
     @issue = Issue.find(params[:id])
     @issues = Issue.all.reverse

  end

  def readmode
    @issues = Issue.all.reverse
  end

  def notifies
    @notifies = Issue.where('category_id = 3').reverse
  end
end
