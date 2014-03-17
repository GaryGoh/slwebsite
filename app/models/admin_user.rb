class AdminUser < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :admin_permission
  belongs_to :sl_department
  belongs_to :society
  belongs_to :gender

  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable


  has_attached_file :admin_pic, :styles => {:medium => "300x300>", :thumb => "100x100>"}, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :admin_pic, :content_type => ['image/jpeg', 'image/jpg', 'image/png']


  VALID_STUID_REGEX = /^[0-9]{9,10}$/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save { self.email = email.downcase }


  validates :email, presence: true,
            format: {with: VALID_EMAIL_REGEX, :message => "请输入正确的email格式"},
            uniqueness: {case_sensitive: false}
  validates :admin_permission, presence: true


  # Here will cause rake db:schema:load problem
  #if (new)
  #  validates :name, presence: true, length: {maximum: 10}
  #  if (:permission)
  #    validates :sl_department_id, presence: true
  #  else
  #    validates :society_id, presence: true
  #  end
  #end

  #validates :stuid,
  #          format: {with: VALID_STUID_REGEX, :multiline => true, :message => "请输入正确的Student ID格式"},
  #          uniqueness: {case_sensitive: false}

  #
  #has_secure_password
  #before_save { |user| user.email = email.downcase }
  #validates :name, presence: true, length: { maximum: 50 }
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #validates :email, presence: true,
  #          format: { with: VALID_EMAIL_REGEX },
  #          uniqueness: { case_sensitive: false }
  #validates :password, presence: true, length: { minimum: 6 }
  #validates :password_confirmation, presence: true


  after_create { |admin| admin.send_reset_password_instructions }

  def permission?
    self.admin_permission != "社团主席"
  end

  def new
    new_record?
  end

  def password_required?
    new_record? ? false : super
  end


  def to_s
    if self.name.nil?
      self.email
    else
      self.name
    end
  end
end
