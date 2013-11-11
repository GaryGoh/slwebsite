class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      session[:admin] = user.admin
      sign_in user
      redirect_to user, :notice => "成功登录"
    else
      render "new", :notice => "email或password不正确"
    end

  end

  def destroy
    sign_out
    redirect_to root_url :notice => "成功登出"
  end

  #def failure
  #  redirect_to signin_url, :notice => "Authentication failed, please try again."
  #end
end
