class AdminPermission < ActiveRecord::Base
  has_many :admin_users

  def to_s
    self.permission_name
  end

end
