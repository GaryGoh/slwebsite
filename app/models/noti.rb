class Noti < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  belongs_to :society

  validates :title, presence: true
  validates :content, presence: true
end
