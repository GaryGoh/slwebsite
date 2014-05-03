class CommentsController < InheritedResources::Base
  before_action :msg, only: [:destroy]
  before_filter :get_user

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
    #@comnent = @user.messages.build(message_params)
    @comment = @issue.messages.build(message_params)

    @comment.save
    respond_with @comment, :location => comments_url

  end



  # DELETE /notis/1
  # DELETE /notis/1.json
  def destroy
    @comment = @user.messages.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_msg
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


  def message_params
    params.require(:comment).permit(:user_id, :issue_id, :content)
  end
end
