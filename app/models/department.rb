class Department < ActiveRecord::Base
  has_many :users

  def to_s
    self.dep_name
  end
end
