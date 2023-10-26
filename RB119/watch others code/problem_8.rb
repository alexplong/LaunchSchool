=begin
Find the length of the longest substring in the given string that is the same in
reverse.
As an example, if the input was "I like racecars that go fast", the substring
(racecar) length would be 7.
If the length of the input string is 0, return value must be 0.
Example:
"а" -> 1
"aab" -> 2
"abcde" -> 1
"zzbaabcd" -> 4
"" -> 0

# Problem
- input: a string
- output: an integer

Requirements/Questions?
- determine longest length of a substring in string that is the same reversed
- will all letters be lowercased? yes
- an empty string returns 0
- single character returns 1

Mental Model
- Get all substrings from given string (self also a substr: "a" -> 'a' -> 1)
- Create a variable to store length and iterate through all substrings
- Check if substring is the same reversed and if so check length and update the max length variable
- return the length

# Examples 
- all returns true

# Data Structures
- String: input
- Integer: output
- Array: collection of substrings
- Integers: counter for outer and nested loop 
- String: a substring

# Algorithm
- Given a string as input
- Create an array to store all substrings that are palindromes
- Create an output variable and set it to 0
- 
- Each substring in substrings
  - if length of substring is greater than output
    - update output variable with length of substring 
- return output

get_all_palindromes helper method
- Initialize an empty array to push substrings to and return
- Initialize a counter i to 0
- Iterate through each character in string with index i
  - Set counter j to reference length of string - 1
  - Initialize a nested loop
    - get substring from range i..j 
    - if substring is equal to reversed substring
      - push substring to substrings array 
    - decrement j by 1
    - break out of inner loop if i >= j
  - increment i by 1
  - break out of outer loop if i == length of input
- Return substrings array
=end

def get_all_palindromes(str)
  substrings = []
  i = 0

  loop do

    j = str.length - 1

    loop do

      substr = str[i..j]
      substrings << substr if substr == substr.reverse
      j -= 1
      break if i >= j

    end
    i += 1
    break if i == str.length
  end

  substrings
end

def longest_palindrome(str)
  substrings = get_all_palindromes(str)
  output = 0

  substrings.each do |substr| 
    output = substr.length if substr.length > output 
  end

  output
end


p longest_palindrome("a") == 1
p longest_palindrome("aa") == 2
p longest_palindrome("baa") == 2
p longest_palindrome("aab") == 2
p longest_palindrome("baabcd") == 4
p longest_palindrome("baablkj12345432133d") == 9

## time 25 min