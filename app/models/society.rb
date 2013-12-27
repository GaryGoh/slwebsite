class Society < ActiveRecord::Base
  has_many :user_societies, :dependent => :destroy
  has_many :users, :through => :user_societies
  has_many :issues, :dependent => :destroy

  belongs_to :department
  has_one :issue_image

  def to_s
    self.society_name
  end
end
