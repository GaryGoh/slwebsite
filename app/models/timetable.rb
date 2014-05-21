class Timetable < ActiveRecord::Base
  belongs_to :user
  belongs_to :notis
end
