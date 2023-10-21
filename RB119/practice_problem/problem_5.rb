# Write a method that takes a string as an argument and returns
# the character that occurs least often in the given string.
# If there are multiple characters with the equal lowest number
# of occurrences, then return the one that appears first in the
# string. When counting characters, consider the uppercase and
# lowercase version to be the same.

## Problem
# input: a string
# output: a new string
#
# explicit/implicit requirements:
# - return char that occurs least often in given string
# - multiple chars with equal lowest number, return the one that appears first
# - consider upcase and downcase chars to be the same 
# - whitespace chars count as a character
#
# clarifying questions?
# - 
# 
## Examples:
# The tests should print "true".
#
## Data Structures
# - String: input
# - String: output - character that occurs least often in string
# - Hash: dictionary - each key is a character with value representig the count
# - Integer: count of characters - minimum of set - dynamically updated
#
## Algorithm
# - Create a variable lowest_count and set to nil
# - Create a dictionary and set to empty hash
# - Given a string as the input
# - Split the string into an array of characters
# - Each character in strings
#   - transform character to downcase form
#   - Check if character is in dictionary
#     - If yes, update value by 1
#     - If no, create new key of character and set value to 1
# - Each key-value pair in dictionary
#   - Compare current value to value in lowest_count
#   - If lowest_count is nil or if current value is lower than lowest_count
#     - Set lowest_count to reference integer bound to current value
#     - Set output to reference string bound to key
# - Return output
#
## Code with Intent
#

def least_common_char(string)
  dictionary = {}
  output = nil
  lowest_count = nil

  string.chars.each do |char|
    char.downcase!
    if dictionary[char]
      dictionary[char] += 1
    else
      dictionary[char] = 1
    end
  end

  dictionary.each do |char, count|
    if lowest_count == nil || count < lowest_count 
      lowest_count = count
      output = char
    end
  end

  output
end

p least_common_char("Hello World") #== "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") #== "t"
p least_common_char("Mississippi") #== "m"
p least_common_char("Happy birthday!") #== ' '
p least_common_char("aaaaaAAAA") #== 'a'

## 15 mins