class HomeBackground < ActiveRecord::Base
  has_attached_file :ava_pic, :styles => {:medium => "1200x900>", :thumb => "100x100>"}, :default_url => "/images/:style/missing.png"
  attr_writer :remove_home_background
  before_save :before_save_callback

  validates_attachment :ava_pic, :presence => true,
                       :size => {:in => 1..10000.kilobytes}


  def remove_home_background
    @remove_home_background || false
  end

  def before_save_callback
    if self.remove_home_background
      self.remove_home_background=nil
    end
  end

end
