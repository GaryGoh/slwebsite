class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :check_login, only: [:index, :show, :edit, :update, :destroy]
  layout "userAdmin", only: [:show]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  def publicShow
    @user = User.find_by(stuid: params[:stuid])
  end
  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @members = Member.all
    @user = User.new
    @timetable = @user.build_timetable

  end


  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    #$login = true
    @user = User.new(user_params)
    @timetable = @user.timetables.build

    respond_to do |format|
      if ( @user.save && @timetable.save )
      #if @user.save
        format.html { redirect_to signin_url, notice: '成功创建新用户.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    #$login = false
    #@timetable = @user.timetable
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: '更新成功' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    if (:id.nil?)
      redirect_to access_error_url :notice => "user id is null"
    else
      @user = User.find(params[:id])
    end
  end

  def timetable_params
    #params.require(:noti).permit(:title, :content, :user_id, :category_id, :society_id, :in, :in_members, :location, :start_time, :end_time)
    #params.require(@user.timetable).permit!
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    #params.require(:user).permit(:stuid, :email, :password, :password_confirmation, :name, :gender_id, :contact, :society_id, :proverb, :avatar)
    params.require(:user).permit!

  end


  # For future development, so far just need to be ignored
  #def timetable_params
  #  params.require(:timetable).permit(:user_id, :start_time, :end_time)
  #end
end
