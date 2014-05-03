class MessagesController < InheritedResources::Base
  before_action :set_msg, only: [:destroy]
  before_filter :get_user

  layout "signinup"
  respond_to :html, :js

  # GET /notis
  # GET /notis.json
  def index
    @messages = Message.all
    unless current_user_stu.nil?
      @message = @user.messages.build
    end

  end

  # POST /notis
  # POST /notis.json
  def create
    @message = @user.messages.build(message_params)
    @message.save
    respond_with @message, :location => messages_url

  end



  # DELETE /notis/1
  # DELETE /notis/1.json
  def destroy
    @message = @user.messages.find(params[:id])
    @message.destroy
    #respond_to do |format|
    #  format.html { redirect_to messages_url }
    #  format.json { head :no_content }
    #end
    respond_with @message, :location => comments_url
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_msg
    @msg = Message.find(params[:id])
  end

  # To get a user
  def get_user
    if (current_user_stu.nil?)
    else
      @user = User.find(current_user_stu.id)
    end
  end


  def message_params
    params.require(:message).permit(:user_id, :msg_content, :msg_font, :msg_position)
  end
end
