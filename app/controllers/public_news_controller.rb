class PublicNewsController < ApplicationController
  layout false, only: [:readmode]
  def allnews
    @issues = Issue.all.reverse
  end

  def shownews
     @issue = Issue.find(params[:id])
  end

  def readmode
    @issues = Issue.all.reverse
  end
end
