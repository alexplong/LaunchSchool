
a = String.new 

# a = '' # another way to create an empty string
a = 'Hello'

# puts a

puts "It's now 12 o'clock." #%Q is an alternative for a double quoted string
puts %Q(It's now 12 o'clock.)

puts "She said, \"YO!\"."

name = 'Roger'
alt_name = 'RoGeR'

# puts name.downcase == alt_name.downcase
# puts "Dave".downcase == alt_name.downcase

# puts "true" if name.casecmp(alt_name) == 0

# if name.casecmp(alt_name) == 0 then puts "true" else puts "false" end 
# puts name.casecmp(alt_name) == 0

name = 'Elizabeth'

# puts "Hello, #{name}!"

first_name = 'John'
last_name = 'Doe'

fullname = "#{first_name} #{last_name}"
puts fullname

state = 'tExAs'
state.capitalize!

# puts state

greeting = 'Hello!'
# puts greeting

# greeting.replace('Goodbye!')
greeting.gsub!("Hello", "Goodbye")
# puts greeting

alphabet = 'abcdefghijklmnopqrstuvwxyz'

# n = alphabet.length

# n.times do |i|
#   puts alphabet[i]
# end

# puts alphabet.split('')

words = 'car human elephant airplane'

# words.split(' ').each do |word|
#   puts "#{word}s"
# end

colors = 'blue pink yellow orange'
# puts colors.split(' ').include?('yellow')
# puts colors.split(' ').include?('purple')
puts colors.include?('yellow')
puts colors.include?('purple')

colors = 'blue boredom yellow'
# puts colors.include?('red')
# puts colors.split(' ').include?('red')