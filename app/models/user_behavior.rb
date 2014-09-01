class UserBehavior < ActiveRecord::Base
  belongs_to :user
  belongs_to :issue
  belongs_to :noti
  belongs_to :material

end
