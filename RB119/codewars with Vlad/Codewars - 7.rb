=begin
A pangram is a sentence that contains every single letter of the alphabet at least once. For example, the sentence "The quick brown fox jumps over the lazy dog" is a pangram, because it uses the letters A-Z at least once (case is irrelevant).

Given a string, detect whether or not it is a pangram. Return True if it is, False if not. Ignore numbers and punctuation.
=end

=begin
input: a string
output: Boolean

rules/questions:
- pangram? sentence with every single letter of alphabet at least once (at least 26 chars?)
- dont care about case
- ignore numbers and punctuation
- return false if string < 26 characters

mental model
- return false if string has less than 26 characters -> not every char in alphabet is in string
- if string > 26 characters, we can create a dictionary
- count keys and if key is >= 26 return true else false

algorithm
#- set a constant LETTERS to reference an array of characters
- return false if string length is less than 26 characters 
- given a string as input
- get a uniq array of downcased characters
- each unique char in characters
  - count number of current char in input string
  - set current char as key and count as value in dictionary hash
- count keys in dictionary
- return true if returned value by count is greater than or equal to 26
- otherwise return false
=end

# LETTERS = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)

def pangram?(str)
  return false if str.size < 26
  dictionary = {}

  str.downcase.chars.uniq.each do |char|
    dictionary[char] = str.count(char) if char.match?(/[A-Za-z]/)
    # dictionary[char] = str.count(char) if LETTERS.include?(char)
  end

  return true if dictionary.keys.length >= 26
  false
end

p pangram?("The quick brown fox jumps over the lazy dog.") == (true) # "This is not a pangram."
p pangram?("This is not a pangram.") == (false)

# 13 min
