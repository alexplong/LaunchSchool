def rotate_array(input)
  output = input.map {|a| a}
  output.push(output.shift)
end

def rotate_rightmost_digits(number, digits)

  number_string = number.to_s
  return rotate_array(number.to_s.chars).join.to_i if digits == number_string.length
  
  front_half = number_string[0..number_string.length - 1 - digits]
  back_half = rotate_array(number_string[-digits..-1].chars)
  
  (front_half + back_half.join('')).to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917