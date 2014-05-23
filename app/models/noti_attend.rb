class NotiAttend < ActiveRecord::Base
  belongs_to :noti
  belongs_to :user
end
