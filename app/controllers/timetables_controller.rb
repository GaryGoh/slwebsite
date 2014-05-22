class TimetablesController < InheritedResources::Base
  before_action :set_timetable, only: [:create, :update, :destroy]
  before_filter :get_user

  respond_to :html, :js

  # GET /notis
  # GET /notis.json

  # POST /notis
  # POST /notis.json

  def new
    @timetable = @user.timetabiles.build
  end

  def create
    #@timetable = @user.timetables.build(timetable_params)
    #
    #@timetable.save
    #respond_with :location => shownotis_url(@noti)

    @timetable = @user.timetables.build(timetable_params)

    respond_to do |format|
      if @timetable.save
        format.html { redirect_to shownotis_url(@noti) }
        format.js
        format.json { render action: 'show', status: :created, location: @timetable }
      else
        format.html { render action: 'new' }
        format.json { render json: @timetable.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
    #@timetable = @user.timetables.build(timetable_params)
    #
    #@timetable.save
    #respond_with :location => shownotis_url(@noti)
    @user = User.find(session[:user_id])

    @timetable = @user.timetables.build(timetable_params)

    respond_to do |format|
      if @timetable.save
        format.html { redirect_to shownotis_url(@noti) }
        format.js
        format.json { render action: 'show', status: :created, location: @timetable }
      else
        format.html { render action: 'new' }
        format.json { render json: @timetable.errors, status: :unprocessable_entity }
      end
    end

  end


  # DELETE /notis/1
  # DELETE /notis/1.json
  def destroy
    #user = User.find_by(email: params[:session][:email].downcase)

    @timetable = @user.timetables.find_by(noti_id: $noti_attend.id)
    @timetable.destroy
    respond_to do |format|
      format.html { redirect_to shownotis_url($noti_attend) }
      format.js
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_timetable
    #@timetable = Timetable.find(params[:id])
  end

  # To get a user
  def get_user
    if (session[:user_id].nil?)
    else
      @user = User.find(session[:user_id])
    end
  end


  def timetable_params
    params.require(:timetable).permit!
  end

end
