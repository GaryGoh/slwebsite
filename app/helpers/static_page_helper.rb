module StaticPageHelper

  def interval(intervalDays)
    case
      when intervalDays > 31 && intervalDays < 365
        intervalDays = intervalDays.to_i / 30
        return intervalDays.to_s + "个月前"
      when intervalDays >= 365
        intervalDays = intervalDays.to_i / 365
        return intervalDays.to_s + "年前"
      when intervalDays >2 && intervalDays <= 31
        intervalDays = intervalDays.to_i / 1
        return intervalDays.to_s + "天前"
      when intervalDays < 1
        return "今天"
      when intervalDays >=1 && intervalDays <= 2
        return "昨天"
      else
        return

    end
  end


end
