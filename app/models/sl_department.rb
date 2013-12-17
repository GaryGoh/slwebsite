class SlDepartment < ActiveRecord::Base
  has_many :admin_users

  def to_s
    self.sl_dep_name
  end
end
