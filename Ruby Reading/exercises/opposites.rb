def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

loop do
  x = nil
  y = nil

  loop do
    puts ">> Please enter a positive or negative integer:"
    x = gets.chomp
    break if valid_number?(x)
    puts ">> Invalid input. Only non-zero integers are allowed."

  end

  loop do
    puts ">> Please enter a positive or negative integer:"
    y = gets.chomp
    break if valid_number?(y)
    puts ">> Invalid input. Only non-zero integers are allowed."
  end

  x = x.to_i
  y = y.to_i

  if (x < 0 && y > 0) || (x > 0 && y < 0)
    answer = x + y
    puts "#{x} + #{y} = #{answer}"
    break
  end

puts ">> Sorry. One integer must be positive, one must be negative."

end