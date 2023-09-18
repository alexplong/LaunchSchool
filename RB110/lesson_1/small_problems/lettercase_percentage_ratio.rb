def letter_percentages(string)

  stats_output = { lowercase: 0.0, uppercase: 0.0, neither: 0.0 }
  lowercase, uppercase, neither = [0, 0, 0]

  letters = string.chars
  letters.each do |letter|
    if letter.index(/[a-z]/)
      lowercase += 1
    elsif letter.index(/[A-Z]/)
      uppercase += 1
    else
      neither += 1
    end
  end
  stats_output[:lowercase] = ((lowercase / letters.length.to_f) * 100).round(1)
  stats_output[:uppercase] = ((uppercase / letters.length.to_f) * 100).round(1)
  stats_output[:neither] = ((neither / letters.length.to_f)* 100).round(1)
  stats_output
  end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }