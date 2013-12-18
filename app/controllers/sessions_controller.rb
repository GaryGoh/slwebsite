class SessionsController < ApplicationController
  layout "signinup"

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    #user = AdminUser.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password]) && user.is_active
      session[:user_id] = user.id
      sign_in_stu user
      $user_login = true
      redirect_to user, :notice => "成功登录"
    else
      redirect_to signin_url, :notice => "email或password不正确 / 该账号已被注销,详细请联系社团联合会"
    end

  end

  def destroy
    $user_login = false
    sign_out_stu
    redirect_to root_url :notice => "成功登出"
  end

  #def failure
  #  redirect_to signin_url, :notice => "Authentication failed, please try again."
  #end
end
