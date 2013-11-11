class PublicNewsController < ApplicationController
  def allnews
    @issues = Issue.all
  end

  def shownews
     @issue = Issue.find(params[:id])
  end

end
