def get_grade(score_one, score_two, score_three)

  score_sum = score_one + score_two + score_three
  average = score_sum / 3

  case average
  when 90..100
    "A"
  when 80...90
    "B"
  when 70...80
    "C"
  when 60...70
    "D"
  else
    "F"
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"