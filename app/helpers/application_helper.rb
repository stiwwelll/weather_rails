module ApplicationHelper

  def weather_icon(data)
    condition = data
    case condition
    when 500...504
      "icon-4"
    when 200...232
      "icon-11"
    when 600...622
      "icon-11"
    when 701
      "icon-8"
    when 800
      "icon-2"
    when 801
      "icon-3"
    when 802
      "icon-5"
    when 803
      "icon-6"
    when 511...531
      "icon-10"
    end
  end

  def day_formatted(data)
    parsed_time = Time.at(data)
    parsed_time.strftime("%A")
  end

  def date_formatted(data)
    parsed_time = Time.at(@query["list"].first["dt"])
    parsed_time.strftime("%d %b")
  end

  def temp(data)
    data.floor
  end

  def wind_speed
    query = @query["list"].first["speed"]
    speed = query * 3.6
    "#{speed.floor}km/h"
  end

  def wind_direction
    query = @query["list"].first["deg"]
    i = query.to_i
    case i
    when 56..124
      "East"
    when 124..236
      "South"
    when 236..304
      "West"
    else
      "North"
    end
  end

end
