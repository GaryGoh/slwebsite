class User < ActiveRecord::Base
  has_many :issues
  has_secure_password

  def get_admin?
    @user.admin
  end


  ## TO PROTECT vicious sign up from unknown user##

  ## if being login model that using following
  before_save { self.email = email.downcase }
  before_create :create_remember_token

  VALID_STUID_REGEX = /^[0-9]{9,10}$/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :stuid, presence: true,
            format: {with: VALID_STUID_REGEX, :multiline => true, :message => "请输入正确的Student ID格式"},
            uniqueness: {case_sensitive: false}

  validates :email, presence: true,
            format: {with: VALID_EMAIL_REGEX, :message => "请输入正确的email格式"},
            uniqueness: {case_sensitive: false}

  if !(:signed_in)
    validates :password, length: {in: 6..20, :message => "密码长度在6 - 20 之间"}
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
