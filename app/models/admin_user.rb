class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :admin_permission
  belongs_to :sl_department
  belongs_to :society
  belongs_to :gender

  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable


  VALID_STUID_REGEX = /^[0-9]{9,10}$/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i


  validates :email, presence: true,
            format: {with: VALID_EMAIL_REGEX, :message => "请输入正确的email格式"},
            uniqueness: {case_sensitive: false}
  #validates :stuid,
  #          format: {with: VALID_STUID_REGEX, :multiline => true, :message => "请输入正确的Student ID格式"},
  #          uniqueness: {case_sensitive: false}


  after_create { |admin| admin.send_reset_password_instructions }

  def password_required?
    new_record? ? false : super
  end

end
