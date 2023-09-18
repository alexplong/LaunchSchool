def letter_case_count(input)

  case_count = { lowercase: 0, uppercase: 0, neither: 0}
  input.split('').each do |char|
    if char.ord >= 97 && char.ord <= 122
      case_count[:lowercase] += 1
    elsif char.ord >= 65 && char.ord <= 90
      case_count[:uppercase] += 1
    else
      case_count[:neither] += 1
    end
  end
  
  case_count
end

puts letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
puts letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
puts letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
puts letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }