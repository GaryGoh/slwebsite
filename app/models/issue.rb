class Issue < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  has_attached_file :issue_pic, :styles => {:medium => "640x480>", :thumb => "200x200>"}, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :issue_pic, :content_type => ['image/jpeg', 'image/jpg', 'image/png']
end
