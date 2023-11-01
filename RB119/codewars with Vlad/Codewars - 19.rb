=begin
Write a function that accepts a string, and returns the same string with all even indexed characters in each word upper cased, and all odd indexed characters in each word lower cased. The indexing just explained is zero based, so the zero-ith index is even, therefore that character should be upper cased and you need to start over for each word.

The passed in string will only consist of alphabetical characters and spaces(' '). Spaces will only be present if there are multiple words. Words will be separated by a single space(' ').
Examples:

"String" => "StRiNg"
"Weird string case" => "WeIrD StRiNg CaSe"
=end

## Second Attempt
=begin
Input: a string
Output: transformed input string

RULES
Explicit:
- Pass by reference - return same string with all even indexed chars in each word upper cased
                                              all odd indexed chars in each word lower cased
- Zero index is considered even
- Index restarts at 0 for each word
- Only alphabetical chars and spaces ' '
- Spaces only present if there are multiple words

EXAMPLE
"hey there"
 012 01234  # index for each word restarts

 "HeY ThErE"

 ALGORITHM updated with #replace usage
 - Given a string as input
 - Get an Array of words from input string
 - Initialize a variable new_string and set to empty string
 - Each word in words
  - Each char in word with index
    - If current index is even        ### convert if statement on lines 37-40 to a ternary operator
      - Transform current char to uppercase and append to new_string 
    - Else
      - Transform current char to lowercase and append to new_string
  - Append a space ' ' to new_string unless word is equal to last element in words array
 - Replace value of object referenced by input string with value from new_string
 - Return mutated input string
=end

def weirdcase(str)
  str_arr = str.split
  new_string = ""
  str_arr.each do |word|
    word.chars.each_with_index do |char, i|
      i.even? ? new_string << char.upcase : new_string << char.downcase
    end
    new_string << ' ' unless word == str_arr.last
  end
  str.replace(new_string)
end

p weirdcase('This') == 'ThIs'
p weirdcase('is') == 'Is'
p weirdcase('This is a test') == 'ThIs Is A TeSt'
p weirdcase('hEy tHeRe') == 'HeY ThErE'
## 19 minutes





## First Attempt
=begin
- Solution was kind of roundabout due to trying to transform elements in the string in place

Input: a string
Output mutated same string

RULES
Explicit:
- Pass by reference
- All even indexed characters IN EACH WORD uppercase
- All odd indexed characters IN EACH WORD are lowercase
- Zero index is even
- Zero based indexing restarts FOR EACH WORD
- Only alphabetical chars and spaces (only present if there are multiple words)
- Words separated by space ' '

Implicit:
-

DATA STRUCTURES
- 

ALGORITHM
- Given a string as input
- Create a variable as a counter and set to 0
- Initialize a simple loop to iterate through string
  - Break if counter greater than or equal to length of input string
  - if element at position counter is ' '
    - increment counter by 1
    - next
  - Create a word index and set to 0
  - While element at counter != nil AND element counter is not a space
    - Reassign element at current index position to return value of current element trasnform to uppcase if even
    - Reassign element at current index position to return value of current element trasnform to lowercase if odd
    - Increment word index by 1
    - Increment counter by 1
- Return mutated string

=end

# def weirdcase(string)
#   counter = 0

#   loop do
#     break if counter >= string.length
#     if string[counter] == ' '
#       counter += 1
#       next
#     end

#     word_index = 0

#     while string[counter] != nil && string[counter] != ' '
#       if word_index.odd?
#         string[counter] = string[counter].downcase
#       else
#         string[counter] = string[counter].upcase
#       end
#       word_index += 1
#       counter += 1
#     end

#   end

#   string
# end

# p weirdcase('This') == 'ThIs'
# p weirdcase('is') == 'Is'
# p weirdcase('This is a test') == 'ThIs Is A TeSt'
# p weirdcase('hEy tHeRe') == 'HeY ThErE'