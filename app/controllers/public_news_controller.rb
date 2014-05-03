class PublicNewsController < ApplicationController
  layout false, only: [:readmode]
  before_filter :get_user


  def allnews
    @issues = Issue.search(params[:search])
    @issues_top = Issue.where('category_id = 1').search(params[:search])
    @issues_society = Issue.where('category_id = 2').search(params[:search])
    @issues_school = Issue.where('category_id = 3').search(params[:search])
  end

  def shownews
    @issue = Issue.find(params[:id])
    #@issues = Issue.where('category_id = 1' || 'category_id = 2').reverse
    @comments = Comment.where(:issue_id => @issue)

    unless current_user_stu.nil?
      @comment = @user.comments.build
      @comments_own = @comments.where(:user_id => @user.id)
    end

  end

  def shownotis
    @noti = Noti.find(params[:id])
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

  def get_issue
    if ((params[:issue_id]).nil?)
      #redirect_to access_error_url  :notice => "user id is null"
    else
      @issue = Issue.find(params[:issue_id])
    end
  end

  def get_user
    if (current_user_stu.nil?)
    else
      @user = User.find(current_user_stu.id)
    end
  end


end
