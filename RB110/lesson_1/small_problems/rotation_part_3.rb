def rotate_array(input)
  output = input.map {|a| a}
  output.push(output.shift)
end

def rotate_rightmost_digits(number, digits)

  number_string = number.to_s
  if digits == number_string.length
    return rotate_array(number.to_s.chars).join.to_i

  end
  front_half = number_string[0..number_string.length - 1 - digits]
  back_half = number_string[-digits..-1].chars
  back_half.push(back_half.shift)
  (front_half + back_half.join('')).to_i
end

def max_rotation(input)
  counter = input.to_s.length
  loop do
    input = rotate_rightmost_digits(input, counter)
    counter -= 1
    break if counter == 0
  end
  input
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845