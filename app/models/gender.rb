class Gender < ActiveRecord::Base
  has_many :users

  def to_s
    self.gender_name
  end
end
