class Issue < ActiveRecord::Base
  paginates_per 6

  belongs_to :user
  belongs_to :category
  belongs_to :society

  has_many :comments, :dependent => :destroy
  has_many :issue_images, :dependent => :destroy
  accepts_nested_attributes_for :issue_images, allow_destroy: true

  has_attached_file :issue_pic, :styles => {:medium => "640x480>", :thumb => "50x50>", :ind => "320x240"}, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :issue_pic, :content_type => ['image/jpeg', 'image/jpg', 'image/png']

  validates :title, presence: {:message => "新闻标题不能为空"}
  validates :content, presence: {:message => "新闻内容不能为空"}
  validates :society_id, presence: {:message => "请先加入社团，再发布新闻"}

  is_impressionable :counter_cache => true, :column_name => :issue_catch_counter, :unique => :request_hash

  def self.search(search)
    if search
      find(:all, :conditions => ['content LIKE ? OR title LIKE ?', "%#{search}%", "%#{search}%"])
    else
      find(:all)
    end
  end

  def self.tags(tags)
    if tags
      find(:all, :conditions => ['category_id LIKE ?', "%#{tags}%"])
    else
      find(:all)
    end
  end



end
