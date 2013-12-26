class Society < ActiveRecord::Base
  has_many :user_societies, :dependent => :destroy
  has_many :users, :through => :user_societies
  #belongs_to :owner, :class_name => "User", :foreign_key => :user_id
  #has_many :owners, source: :user, through: :users_societies, foreign_key: :user_id

  belongs_to :department

  def to_s
    self.society_name
  end
end
