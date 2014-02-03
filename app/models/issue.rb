class Issue < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  belongs_to :society

  has_many :issue_images, :dependent => :destroy
  accepts_nested_attributes_for :issue_images, allow_destroy: true

  has_attached_file :issue_pic, :styles => {:medium => "640x480>", :thumb => "50x50>", :mini => "50x50>"}, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :issue_pic, :content_type => ['image/jpeg', 'image/jpg', 'image/png']

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
