def twice(input)
  number = input.to_s
  return input * 2 if number.length.odd?
  if number[0, number.length / 2] == number[number.length / 2, number.length]
      input
    else 
      input * 2 
  end
end

puts twice(37) == 74
puts twice(44) == 44
puts twice(334433) == 668866
puts twice(444) == 888
puts twice(107) == 214
puts twice(103103) == 103103
puts twice(3333) == 3333
puts twice(7676) == 7676
puts twice(123_456_789_123_456_789) == 123_456_789_123_456_789
puts twice(5) == 10