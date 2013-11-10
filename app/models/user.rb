class User < ActiveRecord::Base
  has_many :issues
  has_secure_password

  def get_admin?
    @user.admin
  end


  if !(:signed_in)
    ## TO PROTECT vicious sign up from unknown user##

    ## if being login model that using following
    before_save { self.email = email.downcase }
    before_create :create_remember_token
    validates :stuid, presence: true, :length => {is: 10, :message => "学号长度必须为10"}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true,
              format: {with: VALID_EMAIL_REGEX, :message => "请输入正确的email格式" },
              uniqueness: {case_sensitive: false}


    validates :password, length: {in: 6..20, :message => "密码长度在6 - 20 之间"}
  else
    ## if being normal model that using following validations.
    #validates
  end


  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end

end
