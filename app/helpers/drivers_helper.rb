module DriversHelper
  def license(data)
    if data == "large"
      return "大型"
    elsif data== "middle"
      return "中型"
    else
      return "不明"
    end
  end

  def check(boolean)
    if boolean
      return "○"
    end
  end
end
