a = 5

answer = case a
when 5
  "a is 5"
when 6
  "a is 6"
else  
  "a is not 5 or 6"
end

puts answer

# can also be setup without variable and looks similar to if statement
# case
# when a == 5
#   "a is 5"
# when a == 6
#   "a is 6"
# else  
#   "a is not 5 or 6"
# end

def cap_it_if_greater_than_ten(phrase)
  if phrase.length > 10
    phrase.upcase
  else
    phrase
  end
end

puts cap_it_if_greater_than_ten("smello worldly")
puts cap_it_if_greater_than_ten("smello")

puts "Gimme a number between 0 and 100" 
  n = gets.chomp.to_i
  if (n <= 50)
    puts "Your number is between 0 and 50"
  elsif (n < 100)
    puts "Your number is between 51 and 100"
  elsif n > 100
    puts "Your number is 100+"
  else  
    puts "Your number is below 0"
  end
