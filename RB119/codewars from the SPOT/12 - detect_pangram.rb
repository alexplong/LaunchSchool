=begin
Difficulty: medium

A pangram is a sentence that contains every single letter of the alphabet
at least once. For example, the sentence "The quick brown fox jumps over 
the lazy dog" is a pangram, because it uses the letters A-Z at least once 
(case is irrelevant).

Given a string, detect whether or not it is a pangram. Return True if it 
is, False if not. Ignore numbers and punctuation.

input: a string
output: a boolean

RULES
- given a string
- if the string contains all letters of the alphabet
  - return true
  - else return false

ALGORITHM
- Given a string of words
- Transform string into a unique array of downcase characters and select only letters
- Creath a variable result and set to empty hash
- Get a hash collection of the count of unique chars in the given downcased string
- Get an array of the keys from the hash
- Return true if the size of the array is 26
  - Else return false

=end

def panagram?(str)
  # str_arr = str.downcase.chars.select { |char| char.match(/[a-z]/i) }
  # result = {}

  # str_arr.each do |char|
  #   result[char] = str.downcase.count(char)
  # end

  # result.keys.size == 26 ? true : false


  # str.downcase.chars.select { |char| char.match(/[a-z]/i) }.uniq.size == 26

  
  ('a'..'z').to_a.all? { |char| str.include?(char) }
  

end

p panagram?("The quick brown fox jumps over the lazy dog.") == true
p panagram?("This is not a pangram.") == false
