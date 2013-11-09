class User < ActiveRecord::Base
  has_many :issues

  def get_name
    name
  end
end
