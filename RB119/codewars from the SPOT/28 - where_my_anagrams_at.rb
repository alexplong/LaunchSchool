=begin
Difficulty: medium

What is an anagram? Well, two words are anagrams of each other if they both contain 
the same letters. 

Write a function that will find all the anagrams of a word from a list. You will be 
given two inputs a word and an array with words. You should return an array of all 
the anagrams or an empty array if there are none.

For example:

  'abba' & 'baab' == true

  'abba' & 'bbaa' == true

  'abba' & 'abbba' == false

  'abba' & 'abca' == false

=end

=begin
Input: a string and an array of strings
Output: an array of strings or an empty string

RULES
Explicit:
- Find all anagrams of a word from a list
- Return an array of all anagrams or empty array
- two anagrams are words that both contain same letters
Implicit:
- No extra chars

MENTAL MODEL
- given a word to check if list contains anagrams of
- have an emtpy as arr as result
- iterate through list and compare curr word to word 

DATA STRUCTURE
- 1 String: input 1
- 1 Array: input 2
- 1 Array: output

ALGORITHM
- Initialize an output variable and set to empty arr
- Given a word and an array of strings
- Create a hash count of input word
- Iterate through given input array
- Each string in strings
  - Create a hash for curr string 
  - Compare hash for curr string to input string
  - If equal, push curr string to ouput
- Return output
=end

def anagrams(word, arr)
# 
  word_count = word.chars.tally

  arr.select do |curr_word|
    word_count == curr_word.chars.tally
  end

  # output

end

p anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) == ['aabb', 'bbaa']
p anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer']) == ['carer', 'racer']
p anagrams('laser', ['lazing', 'lazy',  'lacer']) == []

## selection