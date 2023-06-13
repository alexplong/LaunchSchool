def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

def read_number
    loop do
      puts ">> Please enter a positive or negative integer:"
      n = gets.chomp
      return n.to_i if valid_number?(n)
      if n == '0' then puts ">> Invalid input. Only non-zero integers are allowed." else puts ">> Invalid input. Please enter a valid integer." end
    end
end


loop do
  x = read_number
  y = read_number
  if (x < 0 && y > 0) || (x > 0 && y < 0)
    answer = x + y
    break puts "#{x} + #{y} = #{answer}"
  else
    puts ">> Sorry. One integer must be positive, one must be negative."
    puts ">> Please start over."
    next
  end
end


