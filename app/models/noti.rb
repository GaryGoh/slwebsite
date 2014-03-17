class Noti < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  belongs_to :society
  belongs_to :timetable

  has_one :noti_attend, :dependent => :destroy

  validates :title, presence: {:message => "通知标题不能为空"}
  validates :content, presence: {:message => "通知内容不能为空"}
  validates :society_id, presence: {:message => "请先加入社团，再发布活动通知"}
  validate :activity_time

  private
  def activity_time
    if :start_time >= :end_time
      errors.add(:start_time, "活动开始时间不能晚于活动结束时间")
    end
  end

  def self.search(search)
    if search
      find(:all, :conditions => ['content LIKE ? OR title LIKE ?', "%#{search}%", "%#{search}%"])
    else
      find(:all)
    end
  end

end
