class HomeBackground < ActiveRecord::Base
  has_attached_file :ava_pic, :styles => {:medium => "1200x900>", :thumb => "100x100>"}, :default_url => "/images/:style/missing.png"

  validates_attachment :ava_pic, :presence => true,
                       :size => { :in => 1..10000.kilobytes }

end
