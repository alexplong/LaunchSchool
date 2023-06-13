# Use the each method of Array to iterate over [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]. Print each value

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# arr.each do |value|
#   # if value > 5
#   #   puts value
#   # end
# end

new_arr = arr.select do |value|
  value % 2 != 0
end

# puts new_arr
# arr.push(11)
# print arr
# arr.unshift(0)
# print arr
# arr.pop
# print arr
# arr.push(3)
# print arr
# newer_arr = arr.uniq
# print newer_arr

old_hash = {:Kobe => 24}
# puts old_hash

my_hash = {}
my_hash[:Kobe] = 24
# puts my_hash

my_other_hash = Hash.new
my_other_hash[:Kobe] = 24
# puts my_other_hash

h = {a:1, b:2, c:3, d:4}

# puts h[:b]

h[:e] = 5
# puts h

# h.select! do |key, value|
#   value >= 3.5
# end

h.delete_if do |key, value|
  value < 3.5
end
# puts h


# hash values as arrays
hash = {names: ['bob', 'joe', 'susan']}

# array of hashes
arr = [{name: 'bob'}, {name: 'joe'}, {name: 'susan'}]



contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
fields = [:email, :address, :phone]

# Expected output:
#  {
#    "Joe Smith"=>{:email=>"joe@email.com", :address=>"123 Main st.", :phone=>"555-123-4567"},
#    "Sally Johnson"=>{:email=>"sally@email.com", :address=>"404 Not Found Dr.",  :phone=>"123-234-3454"}
#  }

# puts contacts

# index = 0

# contacts.each do |k,v|
#   # contacts[k][:email] = contact_data[index][0]
#   # contacts[k][:address] = contact_data[index][1]
#   # contacts[k][:phone] = contact_data[index][2]

#   fields.each do |field|
#     contacts[k][field] = contact_data[index][fields.index(field)]
#     # puts fields.index(field)
#     # puts contacts[k]
#   end

# index += 1
# end
# # puts contacts["Joe Smith"][:email]
# # puts contacts["Sally Johnson"][:phone]
# # p contacts


contacts.each_with_index do |(key, value), idx| # that parenthesis around the key-value pair is really important here for each_with_index
  fields.each do |field|
    contacts[key][field] = contact_data[idx][fields.index(field)]
    # puts contacts[key]
  end
end

# p contacts






arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

arr.delete_if do |item|
  item.start_with?('s', 'w')
end
# puts arr

a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']

# return new array containing only the first word of each item 
b = []
a.each do |words|
  b.push(words.split(' ')[0])
end

# p b

# process_the_loop = [true, false].sample

# if process_the_loop
#   loop do
#     puts "the loop was processed"
#     break
#   end
# else
#   puts "the loop was not processed"
# end

# loop do
#   puts 'What does 2 + 2 equal?'
#   answer = gets.chomp.to_i
#   if answer == 2 + 2
#       puts "That's correct"
#       break
#     end
#     puts "Wrong answer"
# end

# numbers = []

# loop do
#   puts 'Enter any number:'
#   input = gets.chomp.to_i
#   numbers.push(input)
#   break if numbers.length == 5
# end
# puts numbers


# names = ['Sally', 'Joe', 'Lisa', 'Henry']
# puts names
# loop do
#   break if names.empty?
#   names.shift
# end
# puts "---"
# p names


# 5.times do |index|
#   puts index
#   # ...
#   break if index == 2
# end

# number = 0

# until number == 10
#   number += 1
#   next if number.odd?
#   puts number
# end


# number_a = 0
# number_b = 0

# loop do
#   number_a += rand(2)
#   number_b += rand(2)

#   # next unless number_a == 5 || number_b == 5


#   puts number_a
#   puts number_b
#   break
# end

def greeting
  puts 'Hello!'
end

number_of_greetings = 2

while number_of_greetings > 0
  greeting
  number_of_greetings -= 1
end