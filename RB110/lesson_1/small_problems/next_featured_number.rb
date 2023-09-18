def featured(num)

  digit_test = num.to_s.chars


  loop do
    num += 1
    digit_test = num.to_s.chars
    odd, div_by_7, once = [num.odd?, num % 7 == 0, digit_test.length == digit_test.uniq.length]
    if odd && div_by_7 && once
      num
      break
  end
  "There is no possible number that fulfills those requirements"
end

# p featured(12) == 21
# p featured(20) == 21
# p featured(21) == 35
# p featured(997) == 1029
# p featured(1029) == 1043
p featured(999_999) #== 1_023_547
p featured(999_999_987) #== 1_023_456_987

# p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

