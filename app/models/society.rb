class Society < ActiveRecord::Base
  has_many :user_societies, :dependent => :destroy
  has_many :users, :through => :user_societies
  has_many :issues, :dependent => :destroy
  has_many :notis, :dependent => :destroy


  belongs_to :department
  has_one :issue_image

  has_attached_file :logo, :styles => {:medium => "200x200", :thumb => "100x100", :logo => "64x64", :mini => "40x40"}, :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :logo, :content_type => ['image/jpeg', 'image/jpg', 'image/png']


  def to_s
    self.society_name
  end
end
