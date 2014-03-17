class Item < ActiveRecord::Base
  has_many :subitems, :dependent => :destroy
end
