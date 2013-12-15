class Category < ActiveRecord::Base
  has_many :issues, :dependent => :destroy

  def to_s
    self.category_name
  end

end
