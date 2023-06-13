response = nil

loop do
  puts "Do you want me to print something? (y/n)"

  response = gets.chomp.downcase

  # break if response == "y" || response == "n"
  # break if ['y', 'n'].include?(response)
  break if %w(y n).include?(response) # same as above just syntax different %w(y n) == ['y', 'n']
  puts "Invalid response"
end
puts "something" if response == 'y'