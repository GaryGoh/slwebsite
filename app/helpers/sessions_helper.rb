module SessionsHelper
  def sign_in_stu(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    self.current_user_stu = user
  end

  def signed_in_stu?
    !current_user_stu.nil?
  end

  def check_login
    unless signed_in_stu?
      redirect_to "/signin"
    end
  end

  def sign_out_stu
    self.current_user_stu = nil
    cookies.delete(:remember_token)
  end

  def current_user_stu=(user)
    @current_user_stu = user
  end

  def current_user_in_issue=(user)
    @current_user_in_issue = @issue.user
  end

  def current_user_stu
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user_stu ||= User.find_by(remember_token: remember_token)
  end
end
