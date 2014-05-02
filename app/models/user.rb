class User < ActiveRecord::Base
  has_many :issues, :dependent => :destroy
  has_many :notis, :dependent => :destroy
  has_many :user_societies, :dependent => :destroy
  has_many :societies, :through => :user_societies

  has_one :timetable, :dependent => :destroy

  #has_many :user_notis, :dependent => :destroy
  #has_many :notis, :through => :user_notis
  #belongs_to :user_society
  #has_many :societies_as_owner, :class_name => "Society"

  accepts_nested_attributes_for :user_societies, allow_destroy: true
  #accepts_nested_attributes_for :user_notis, allow_destroy: true
  #accepts_nested_attributes_for :societies


  belongs_to :member
  belongs_to :gender

  has_secure_password
  has_attached_file :avatar, :styles => {:medium => "300x300>", :thumb => "100x100>"}, :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/jpg', 'image/png']


  def self.sweep(time = 1.hour)
    if time.is_a?(String)
      time = time.split.inject { |count, unit| count.to_i.send(unit) }
    end

    delete_all "updated_at < '#{time.ago.to_s(:db)}'"
  end


  ## TO PROTECT vicious sign up from unknown user##

  ## if being login model that using following
  before_save { self.email = email.downcase }
  #before_create :create_remember_token

  VALID_STUID_REGEX = /^[0-9]{9,10}$/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i


  validates :email, presence: true,
            format: {with: VALID_EMAIL_REGEX, :message => "请输入正确的email"},
            uniqueness: {case_sensitive: false, :message => "此email已经被注册"}
  validates :stuid, presence: true,
            format: {with: VALID_STUID_REGEX, :multiline => true, :message => "请输入正确的Student ID格式"},
            uniqueness: {case_sensitive: false, :message => "此学号已经被注册"}, on: :create

  # if needs to validate by legal student id then add following
  validate :member_id_exists, on: :create

  unless $user_login
    validates :password,
              length: {in: 6..20, :message => "密码长度在6 - 20 之间"}, on: :create
  end


  def check_signin?
    $user_login
  end


  private
  def member_id_exists
    errors.add(:stuid, "此学号不能注册社联网站") unless Member.exists?(:memid => self.stuid)
  end

  #def member_id_exists
  #  if Member.where(:memid => self.stuid).blank?
  #    return true
  #  else
  #    return false
  #  end
  #
  #end


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
