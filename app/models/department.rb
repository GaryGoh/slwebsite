class Department < ActiveRecord::Base
  has_many :societies

  def to_s
    self.dep_name
  end

  def get_url(name)
    case name
      when "公益实践中心"
        return "gy_url"
      when "体育竞技中心"
        return "ty_url"
      when "文娱兴趣中心"
        return "wy_url"
      when "学术科技中心"
        return "xs_url"
    end
  end
end
