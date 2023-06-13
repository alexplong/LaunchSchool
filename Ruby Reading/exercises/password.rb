
password = "KObE!"


loop do
  puts ">> Please enter your password"
  user_password = gets.chomp
  break if password == user_password
  puts ">> Invalid password"

end

puts "Welcome"

