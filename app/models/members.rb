class Members < ActiveRecord::Base
  has_one :user, :dependent => :destroy

  def get_memberid
    self.memid
  end
end
