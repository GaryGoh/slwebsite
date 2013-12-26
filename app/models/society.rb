class Society < ActiveRecord::Base
  has_many :user_societies, :dependent => :destroy
  has_many :users, :through => :user_societies
  has_many :issues, :dependent => :destroy

  belongs_to :department

  def to_s
    self.society_name
  end
end
