class NotisController < InheritedResources::Base
  before_action :set_noti, only: [:show, :edit, :update, :destroy]
  before_filter :get_user

  respond_to :html

  # GET /notis
  # GET /notis.json
  def index
    @notis = @user.notis
  end


  def notis
    @user = User.find(params[:user_id])
    @noti = @user.notis.build
  end

  # GET /notis/1
  # GET /notis/1.json
  def show
    @noti = @user.notis.find(params[:id])
  end

  # GET /notis/new
  def new
    @user = User.find(params[:user_id])
    @noti = @user.notis.build

  end

  # GET /notis/1/edit
  def edit
    @noti = @user.notis.find(params[:id])

  end

  # POST /notis
  # POST /notis.json
  def create
    @noti = @user.notis.build(noti_params)

    respond_to do |format|
      if @noti.save
        format.html { redirect_to user_url(@user), notice: '成功发布新闻.' }
        format.json { render action: 'show', status: :created, location: @noti }
      else
        format.html { render action: 'new' }
        format.json { render json: @noti.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notis/1
  # PATCH/PUT /notis/1.json
  def update
    @noti = @user.notis.find(params[:id])
    respond_to do |format|
      if @noti.update(noti_params)
        format.html { redirect_to user_url(@user), notice: '成功编辑新闻.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @noti.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notis/1
  # DELETE /notis/1.json
  def destroy
    @noti = @user.notis.find(params[:id])
    @noti.destroy
    respond_to do |format|
      format.html { redirect_to user_url(@user) }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_noti
    @noti = noti.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def noti_params
    #params.require(:noti).permit(:title, :content, :user_id, :category_id, :society_id, :in, :in_members, :location, :start_time, :end_time)
    params.require(:noti).permit!
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
