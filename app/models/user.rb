class User < ActiveRecord::Base
  has_many :issues
  has_secure_password

  if !(:signed_in)
    ## if being login model that using following
    before_save { self.email = email.downcase }
    before_create :create_remember_token
    validates :stuid, presence: true, length: {maximum: 50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true,
              format: {with: VALID_EMAIL_REGEX},
              uniqueness: {case_sensitive: false}

    validates :password, length: {minimum: 6}
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
