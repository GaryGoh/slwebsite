class Member < ActiveRecord::Base
  has_one :user,  :dependent => :destroy

  def to_s
    self.memid
  end
end

