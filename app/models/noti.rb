class Noti < ActiveRecord::Base
  paginates_per 6

  belongs_to :user
  belongs_to :category
  belongs_to :society
  belongs_to :timetable

  has_one :noti_attend, :dependent => :destroy
  has_many :timetable, :dependent => :destroy

  validates :title, presence: {:message => "通知标题不能为空"}
  validates :content, presence: {:message => "通知内容不能为空"}
  validates :society_id, presence: {:message => "请先加入社团，再发布活动通知"}
  validate :activity_time

  is_impressionable :counter_cache => true, :column_name => :noti_catch_counter, :unique => :session_hash
  #impressionist :unique => [:impressionable_type, :impressionable_id, :session_hash]



  private
  def activity_time
    if ((start_time).to_time.to_i >= (end_time).to_time.to_i)
      errors.add(:start_time, "活动开始时间不能晚于活动结束时间")
    end
  end

  #def self.search(search)
  #  if search
  #    find(:all, :conditions => ['content LIKE ? OR title LIKE ?', "%#{search}%", "%#{search}%"])
  #  else
  #    find(:all)
  #  end
  #end

  def self.tags(search)
    if search
      find(:all, :conditions => ['category_id LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

end
