# arr = ['10', '11', '9', '7', '8']

# arr.sort do |a, b|
#   b.to_i <=> a.to_i
# end

# p arr
#######

# books = [
#   {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
#   {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
#   {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
#   {title: 'Ulysses', author: 'James Joyce', published: '1922'}
# ]

# books.sort_by do |book|
#   book[:published]
# end
#######

# arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
# arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
# arr3 = [['abc'], ['def'], {third: ['ghi']}]
# hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
# hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

# arr1[-1][-1][-1]
# arr2[-1][:third][0]
# arr3[-1][:third][0][0]
# hsh1['b'][-1]
# hsh2[:third].key(0)
#######

# arr1 = [1, [2, 3], 4]
# arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
# hsh1 = {first: [1, 2, [3]]}
# hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

# p (arr1.map do |num|
#   if num.to_s.to_i != num
#     num.map do |n|
#       if n == 3 then 4 else n end
#     end
#   else 
#   if num == 3 then 4 else num end
#   end
# end)

# p (arr2.map do |obj|
#   if obj.to_s.to_i == obj
#     if obj == 3 then 4 else obj end
#   else
#     obj
#   end
# end)

# arr1[1][1] = 4
# arr2[-1] = 4
# hsh1[:first][-1][0] = 4
# hsh2[['a']][:a][-1] = 4
#######

# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# p munsters.values.select {|hsh| hsh["gender"]=="male
# "}.map {|hsh| hsh["age"]}.inject(:+)

# munsters.each do |key, value|
#   puts "#{key} is a #{value["age"]}-year-old #{value["gender"]}"
# end
#######

# a = 2
# b = [5, 8]
# arr = [a, b]

# arr[0] += 2
# arr[1][0] -= a
#######

# hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

# hsh.each do |_, arr|
#   arr.each do |string|
#     string.chars { |char| puts char if char.match(/[aeiou]/)}
#   end
# end
#######

# arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

# p (arr.map do |sub_arr|
#   sub_arr.sort do |a, b|
#     b <=> a
#   end
# end)
#######

# hsh = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
# p (hsh.map do |sub_hsh|
#   sub_hsh.map do |key, value|
#     [key, value += 1]
#   end.to_h
# end)
#######

# arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]

# p (
# arr.map do |sub_arr|
#   sub_arr.each_with_object([]) do |num, acc|
#     acc << num if num % 3 == 0 
#   end
# end
# )
#######

# arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# # expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

# p (
# arr.each_with_object({}) do |sub_arr, new_hsh|
#   new_hsh[sub_arr[0]] = sub_arr[1]
# end
# )
#######

# arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]
# p (
# arr.sort_by do |sub_arr|
#   sub_arr.select {|n| n.odd? } 
# end
# )
#######

# hsh = {
#   'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
#   'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
#   'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
#   'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
#   'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
# }
# p (
# hsh.map do |_, characteristics|
#   if characteristics[:type] == 'fruit'
#     characteristics[:colors].map(&:capitalize)
#   else
#     characteristics[:size].upcase
#   end
# end
# )
#######

# arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]
# p (
# arr.select do |hsh|
#   hsh.all? do |_, sub_arr|
#     sub_arr.all? do |value|
#       value.even?
#     end
#   end
# end  
# )
#######

def uuid_return
  hexadecimal = ('a'..'f').to_a + ('0'..'9').to_a

  uuid_section_one = 8
  uuid_section_two = 4
  uuid_section_three = 4
  uuid_section_four = 4
  uuid_section_five = 12

  # uuid = ""

  [
    uuid_section_one, uuid_section_two, uuid_section_three,
    uuid_section_four, uuid_section_five
  ]
  .each_with_object("") do |counter, uuid|
    1.upto(counter) do 
      uuid << hexadecimal.sample
    end
    if counter == 12 then else uuid << '-' end
  end
end

p uuid_return

