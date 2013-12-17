class Department < ActiveRecord::Base
  has_many :societies

  def to_s
    self.dep_name
  end
end
