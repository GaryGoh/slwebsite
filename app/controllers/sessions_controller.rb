class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      sign_in user
      redirect_to user, :notice => "Welcome!"
    else

      render 'new'  ,:notice => "Invalid email/password combination"
    end

  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
