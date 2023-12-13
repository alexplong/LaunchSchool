=begin
Difficulty: medium

Write a method that takes a string as an argument and groups the number of 
times each character appears in the string as a hash sorted by the highest 
number of occurrences.

The characters should be sorted alphabetically e.g:

get_char_count("cba") => {1=>["a", "b", "c"]}

You should ignore spaces, special characters and count uppercase letters as lowercase ones.


input: a string
output: a hash

RULES
- Given a string
- Return a hash with the count as the key (sorted descending order) and an array of sorted chars as the value
  - The chars have a count of the key in the given string
  - Counter uppercase chars as lowercase chars
  - Can ignore spaces, special chars
  - Array of chars should be sorted with integer strings before letters

ALGORITHM
- Given a string
- Get an array of downcase unique chars (letters and numbers) from given string after removing all spaces and special chars
- Iterate through the array of chars with result object set to empty hash
  - Get the count of curr char in downcased input string
  - If count is present in result hash as key
    - Append curr char to the value associated with the curr key
  - Else
    - Create a new key-value pair in result hash with count as key and curr char as single element in an array
- Iterate throug the result hash
  - destructively sort the value (array of chars)
- Sort the hash by the key in descending order
- Return the result hash
=end

# def get_char_count(str)
#   # result = str.downcase.scan(/[a-z0-9]/i).uniq.sort.each_with_object({}) do |char, curr_result|
#   #             curr_count = str.downcase.count(char)
#   #             if curr_result[curr_count]
#   #               curr_result[curr_count] << char
#   #             else
#   #               curr_result[curr_count] = [char] 
#   #             end
#   #           end
  
#   # # result.each do |key, value|
#   # #   value.sort!
#   # # end

#   # result.sort_by { |key, value| -key }.to_h

#   new_str = str.downcase.scan(/[a-z0-9]/i).uniq.sort

#   new_str.group_by do |char|
#     str.downcase.count(char)
#   end.sort_by { |key, value| -key }.to_h

# end

def get_char_count(str)
  arr = str.downcase.delete("^a-z0-9").chars.sort
  arr.uniq.each_with_object({}) do |char, group|
    group[arr.count(char)] ? group[arr.count(char)] << char : group[arr.count(char)] = [char]
  end.sort_by { |k, v| -k }.to_h

end

p get_char_count("Mississippi") == {4=>["i", "s"], 2=>["p"], 1=>["m"]}
p get_char_count("Hello. Hello? HELLO!!") == {6=>["l"], 3=>["e", "h", "o"]}
p get_char_count("aaa...bb...c!") == {3=>["a"], 2=>["b"], 1=>["c"]}
p get_char_count("aaabbbccc") == {3=>["a", "b", "c"]}
p get_char_count("abc123") == {1=>["1", "2", "3", "a", "b", "c"]}
