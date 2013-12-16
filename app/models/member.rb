class Member < ActiveRecord::Base
  has_one :user

  def to_s
    self.memid
  end
end

