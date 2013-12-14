class IssuesController < ApplicationController
  before_action :set_issue, only: [:show, :edit, :update, :destroy]
  before_filter :get_user

  respond_to :html

  # GET /issues
  # GET /issues.json
  def index
    @issues = @user.issues
  end

  # GET /issues/1
  # GET /issues/1.json
  def show
    @issue = @user.issues.find(params[:id])
  end

  # GET /issues/new
  def new
    @user = User.find(params[:user_id])
    @issue = @user.issues.build
  end

  # GET /issues/1/edit
  def edit
    @issue = @user.issues.find(params[:id])
  end

  # POST /issues
  # POST /issues.json
  def create
    @issue = @user.issues.build(issue_params)

    respond_to do |format|
      if @issue.save
        format.html { redirect_to user_url(@user), notice: '成功发布新闻.' }
        format.json { render action: 'show', status: :created, location: @issue }
      else
        format.html { render action: 'new' }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def update
    @issue = @user.issues.find(params[:id])
    respond_to do |format|
      if @issue.update(issue_params)
        format.html { redirect_to user_url(@user), notice: '成功编辑新闻.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    @issue = @user.issues.find(params[:id])
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to user_url(@user) }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_issue
    @issue = Issue.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def issue_params
    params.require(:issue).permit(:title, :content, :user_id, :pic_url, :author)
  end

  # To get a user
  def get_user
    if ((params[:user_id]).nil?)
      redirect_to access_error_url  :notice => "user id is null"
    else
      @user = User.find(params[:user_id])
    end
  end

end