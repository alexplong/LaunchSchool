
user = "admin"
password = "KObE!"

loop do
  puts ">> Please enter your username"
  input_username = gets.chomp

  puts ">> Please enter your password"
  input_password = gets.chomp
  break if input_username == user && input_password == password
  puts ">> Authorization failed"
end

puts "Welcome"