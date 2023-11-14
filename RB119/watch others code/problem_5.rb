=begin
Write a method to find the longest common prefix string amongst an array of
strings. If there is no common prefix, return an empty string "".
Example 1:
Input: ["flower", "flow", "flight"]
Output: "f1"
Example 2:
Input: ["dog", "racecar", "car"]
Output: ""
Explanation: There is no common prefix among the input strings.
Note: All given inputs are in lowercase letters a-z.

# Problem
- input: an array of strings
- output: a string 

Requirements or Clarifying Questions?
- return empty string if no common prefix
- Does case matter? all inputs are in lowercase

# Examples
- all should return true

# Data Structures
- Array: input
- String: output - common prefix among all strings in input array

# Algorithm
- Create variable with empty string as output
- For each string in the array
  - For each character in string
    - Compare character at current index position against all strings
    - If true, add character to output
    - Break out of loop if false
- Return output 
=end

# def common_prefix(arr)

#   arr.each_with_object("") do |string, output|
    
#     string.chars.each_with_index do |char, index|
#       if arr.all? {|str| str[index] == char}
#         output << char 
#       else
#         break 
#       end
#     end
#     break output
#   end
# end

def common_prefix(arr)
  arr = arr.map(&:dup)
  first_word = arr.first.chars

  first_word.select.with_index do |char, idx|
    arr.all? { |word| word[idx] == char}
  end.join

end


p common_prefix(["flower", "flow", "flight"]) == "fl"
p common_prefix(["dog", "racecar", "car"]) == ""
p common_prefix(["interspecies", "interstellar", "interstate"]) == "inters"
p common_prefix(["throne", "dungeon"]) == ""
p common_prefix(["throne", "throne"]) == "throne"

## time 18 min


=begin
Input: an array of strings
Output: a string 

RULES
Explicit:
- find longest common PREFIX amonst strings in an array
- return empty string if no common prefix
- strings are made up of lowercase chars
Implicit:
-


MENTAL MODEL - Selection
- keep track of counter that refers to index of all strings in array
- for each char in 1st string check all others strings for same chars
  - push to output variable if all strings have the char

DATA STRUCTURE
- 1 Array: input
- 1 String: output

ALGORITHM
- Initialize a output var and set to empty string
- Initialize a counter and set to 0
- Given an input array
- Create a simple loop
  - break if counter greater or equal to length 1st string in arr
  - Get curr char in 1st word
  - If in all strings, the index position counter in each string are the same char
    - Append this char to output string if true
    - Increment counter by 1
  - else break if in all strings there are some characters that do not match
- Return output

=end

# def common_prefix(arr)
#   output = ""

#   counter = 0

#   loop do
#     break if counter >= arr[0].size
#     curr_char = arr[0][counter]
#     if arr.all? { |word| word[counter] == curr_char}
#       output << curr_char 
#       counter += 1
#     else
#       break
#     end

#   end
#   output 
# end


# def common_prefix(arr)

#   arr[0].chars.select.with_index do |curr_char, idx|
    
#     arr.all? { |word| word[idx] == curr_char }

#   end.join

# end

## nested iteration with selection
