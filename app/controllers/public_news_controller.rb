class PublicNewsController < ApplicationController
  def allnews
    @issues = Issue.all.reverse
  end

  def shownews
     @issue = Issue.find(params[:id])
  end

end
