class TimetablesController < ApplicationController
  before_action :set_timetable, only: [:show, :edit, :update, :destroy]
  before_filter :check_login, only: [:index, :show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @timetables = Timetable.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @timetable = Timetable.new
  end


  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    #$login = true
    @timetable = Timetable.new(timetable_params)

    respond_to do |format|
      if @timetable.save
        format.html { redirect_to signin_url, notice: '成功创建新用户.' }
        format.json { render action: 'show', status: :created, location: @timetable }
      else
        format.html { render action: 'new' }
        format.json { render json: @timetable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    #$login = false
    respond_to do |format|
      if @timetable.update(timetable_params)
        format.html { redirect_to @timetable, notice: '更新成功' }
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
    @timetable.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_timetable
    if (:id.nil?)
      redirect_to access_error_url :notice => "timetable id is null"
    else
      @user = User.find(params[:id])
    end
  end


  def timetable_params
    params.require(:timetable).permit(:user_id, :start_time, :end_time, :title, :content, :location)
  end
end
