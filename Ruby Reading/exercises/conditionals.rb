# puts "Put a number in"
# a = gets.chomp.to_i

# # if a == 3
# #   puts "a is a 3"

# if a == 3 then puts "a is 3" #end # add if one liner
# elsif a == 4
#   puts "a is a 4"
# else
#   puts "a is neither 3 nor 4"
# end

sun = ['visible', 'hidden'].sample

# puts "The sun is so bright" if sun == 'visible'
# puts "The clouds are blocking the sun!" unless sun == 'visible'

boolean = [true, false].sample

# puts boolean ? "true" : "false" # ternary chooses between two values, not two actions
#### that's why we put puts outside the method invocation and it'll return a value and then we can print that return from the method

# boolean ? puts("true") : puts("false") # if we can't to invoke puts inside the method, need ()

number = 7

# if number
#   puts "My favorite number is #{number}."
# else
#   puts "I don't have a favorite number."
# end

stoplight = ['green', 'yellow', 'red'].sample

# case stoplight
# when "green"
#   puts "GO!"
# when "yellow"
#   puts "SLOW DOWN"
# when "red"
#   puts "STOP"
# else
#   puts "ERROR"
# end


# if stoplight == 'green'
#   puts 'Go!'
# elsif stoplight == 'yellow'
#   puts 'Slow down!'
# else
#   puts 'Stop!'
# end

status = ['awake', 'tired'].sample

my_status = if status == 'awake'
              "Be productive!"
            else 
              "Go to sleep!"
            end

# puts my_status


number = rand(10)

if number == 5
  puts '5 is a cool number!'
else
  puts 'Other numbers are cool too!'
end

stoplight = ['green', 'yellow', 'red'].sample

case stoplight
  when 'green' then puts 'Go!' 
  when 'yellow' then puts 'Slow down!'
  else puts 'Stop!'
end