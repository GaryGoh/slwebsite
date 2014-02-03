class Noti < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  belongs_to :society

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
