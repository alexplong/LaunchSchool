=begin
Difficulty: medium

You must concatenate the nth letter from each word to construct a new word which
should be returned as a string, where n is the position of the word in the list.

Example:

["yoda", "best", "has"]  -->  "yes"
  ^        ^        ^
  n=0     n=1     n=2

Note: Test cases contain valid input only 
i.e. a string array or an empty array; and each word will have enough letters.


input: an array of words
output: a string

RULES
- Given an array of words
- For each word in the given array, get char from word at current index, join them to form a string
- All test cases will be valid
  - Arrays will have correct string amount and size else it's just an empty array

Implicit
- Maintain the cases of each char

ALGORITHM
- Given a string of words
- Iterate through the array of words with index for transformation
  - Get char from curr word at curr idx
- Join the array back to a string and return it
=end

def nth_char(arr)
  arr.map.with_index do |word, idx|
    word[idx]
  end.join
end

p nth_char(['yoda', 'best', 'has']) == 'yes'
p nth_char([]) == ''
p nth_char(['X-ray']) == 'X'
p nth_char(['No', 'No']) == 'No'
p nth_char(['Chad', 'Morocco', 'India', 'Algeria', 'Botswana', 'Bahamas', 'Ecuador', 'Micronesia']) ==  'Codewars'
