class PublicNewsController < ApplicationController
  layout false, only: [:readmode]


  def allnews
    @issues = Issue.search(params[:search])
    @issues_top = Issue.where('category_id = 1').search(params[:search])
    @issues_society = Issue.where('category_id = 2').search(params[:search])
    @issues_school = Issue.where('category_id = 3').search(params[:search])
  end

  def shownews
    @issue = Issue.find(params[:id])
    #@issues = Issue.where('category_id = 1' || 'category_id = 2').reverse
  end

  def shownotis
    @noti = Noti.find(params[:id])

    @user = User.find(params[:user_id])
    @timetable = @user.timetable.build

  end

  def readmode
    @issues = Issue.all.reverse
  end

  def notifies
    @notifies = Noti.search(params[:search]).reverse

  end

  def indexnotic
    @noti = Noti.find(params[:id])
  end

  def create
     @timetable = @user.Timetable.build(issue_params)
  end

  def timetable_params
    params.require(:timetable).permit(:user_id, :start_time, :end_time, :title, :content, :location)
  end
end
