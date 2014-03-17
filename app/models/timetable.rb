class Timetable < ActiveRecord::Base
  belongs_to :user
  has_many :notis, :dependent => :destroy
end
