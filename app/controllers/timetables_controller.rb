class TimetablesController < InheritedResources::Base
before_action :set_timetable, only: [:create, :destroy]
  before_filter :get_user, :get_noti

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
        format.html { redirect_to shownotis_url(@noti)}
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
    @timetable = @user.timetable
    @timetable.destroy
    respond_with @timetable, :location => shownotis_url(@noti)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @timetable = Timetable.find(params[:id])
  end

  # To get a user
  def get_user
    if (session[:user_id].nil?)
    else
      @user = User.find(session[:user_id])
    end
  end

  def get_noti
    if ((params[:noti_id]).nil?)
      #redirect_to access_error_url  :notice => "user id is null"
    else
      @noti = Noti.find(params[:noti_id])
    end
  end


  def timetable_params
    params.require(:timetable).permit!
  end

end
