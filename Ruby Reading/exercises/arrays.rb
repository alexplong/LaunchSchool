pets = ['cat', 'dog', 'fish', 'lizard']

my_pet = pets[2]

# puts my_pet


my_pets = pets[2..3]

# puts "I have a pet #{my_pets[0]} and a pet #{my_pets[1]}!"


pets = ['cat', 'dog', 'fish', 'lizard']
my_pets = pets[2..3]

my_pets.pop

# puts "I have a pet #{my_pets[0]}"

pets = ['cat', 'dog', 'fish', 'lizard']
my_pets = pets[2..3]
my_pets.pop

my_pets.push(pets[1])
# puts "I have a pet #{my_pets[0]} and a pet #{my_pets[1]}"

colors = ['red', 'yellow', 'purple', 'green']

# colors.each do |color|
#   puts "I'm the color #{color}"
# end

numbers = [1, 2, 3, 4, 5]

new_nums = numbers.map do |n|
  n * 2
end

# p new_nums

numbers = [5, 9, 21, 26, 39]
select_nums = numbers.select { |n| n % 3 == 0 }
# p select_nums

fav_num = [['Dave', 7], ['Miranda', 3], ['Jason', 11]]

flattened = fav_num.flatten

# p fav_num
p flattened

array1 = [1, 5, 9]
array2 = [1, 9, 5]

puts array1 == array2