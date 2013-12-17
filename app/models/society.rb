class Society < ActiveRecord::Base
  has_many :users, :dependent => :destroy
  belongs_to :department

  def to_s
    self.society_name
  end
end
