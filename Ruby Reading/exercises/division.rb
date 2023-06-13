def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

numerator = nil
denominator = nil

loop do
  puts "Please enter the numerator"
  numerator = gets.chomp
  break if valid_number?(numerator)
  puts "Please enter a valid integer"
end

# loop do
#   puts "Please enter the denominator"
#   denominator = gets.chomp
#   break if denominator != "0" && valid_number?(denominator) 
#   puts "Invalid input. A denominator of #{denominator} is not allowed"
# end

loop do
  puts "Please enter the denominator"
  denominator = gets.chomp
  if denominator == "0"
    puts "Invalid input. A denominator of 0 is not allowed"
  else
    break if valid_number?(denominator)
    puts "Please enter a valid integer"
  end
end

answer = numerator.to_i / denominator.to_i
puts "#{numerator} / #{denominator} is #{answer}"