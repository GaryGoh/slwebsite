class CommentsController < InheritedResources::Base
  before_action :set_comment, only: [:destroy]
  before_filter :get_user, :get_issue

  respond_to :html, :js

  # GET /notis
  # GET /notis.json
  def index
    @comments = Comment.all
    unless current_user_stu.nil?
      @comment = @user.comments.build
    end

  end

  # POST /notis
  # POST /notis.json
  def create
    @comment = @user.comments.build(comment_params)

    @comment.save
    respond_with @comment, :location => shownews_url(@issue)

  end


  # DELETE /notis/1
  # DELETE /notis/1.json
  def destroy
    @comment = @user.comments.find(params[:id])
    @comment.destroy
    respond_with @comment, :location => shownews_url(@issue)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comm = Comment.find(params[:id])
  end

  # To get a user
  def get_user
    if (current_user_stu.nil?)
    else
      @user = User.find(current_user_stu.id)
    end
  end

  def get_issue
    if ((params[:issue_id]).nil?)
      #redirect_to access_error_url  :notice => "user id is null"
    else
      @issue = Issue.find(params[:issue_id])
    end
  end


  def comment_params
    params.require(:comment).permit(:user_id, :issue_id, :content)
  end
end
