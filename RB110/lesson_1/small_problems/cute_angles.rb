DEGREE = "\xC2\xB0" 

def dms(angle)

  while angle > 360
    angle -= 360 
  end

  while angle < 0
    angle += 360
  end

  degree, minutes, seconds = %w(00 00 00)
  angle_to_string = angle.to_s.split(".")
  degree = angle_to_string[0]
  if angle_to_string[1]
    minutes_decimal_places = angle_to_string[1].length.to_f
    min_and_sec = ((angle_to_string[1].to_f / (10 ** minutes_decimal_places)) * 60.00).to_s.split(".")
    min_sec_decimal_places = min_and_sec[1].length.to_f
    seconds_calculation = ((min_and_sec[1].to_f / (10 ** min_sec_decimal_places)) * 60.00).to_s.split(".")
    minutes = min_and_sec[0]
    seconds = seconds_calculation[0]
  end
  "#{degree}#{DEGREE}#{sprintf('%02d', minutes)}'#{sprintf('%02d', seconds)}\""
end

puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

dms(400) == %(40°00'00")
dms(-40) == %(320°00'00")
dms(-420) == %(300°00'00")