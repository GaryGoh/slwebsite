class UserSociety < ActiveRecord::Base
  belongs_to :user
  belongs_to :society
end
