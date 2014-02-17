class Noti < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  belongs_to :society
  belongs_to :timetable

  has_one :noti_attend, :dependent => :destroy

  validates :title, presence: true
  validates :content, presence: true

  def self.search(search)
    if search
      find(:all, :conditions => ['content LIKE ? OR title LIKE ?', "%#{search}%", "%#{search}%"])
    else
      find(:all)
    end
  end

end
