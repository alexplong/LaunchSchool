=begin
Difficulty: medium

In this kata you are required to, given a string, replace every letter with its 
position in the alphabet.

"a" = 1, "b" = 2, etc.

If anything in the text isn't a letter, ignore it and don't return it.


Example

alphabet_position("The sunset sets at twelve o' clock.")
Should return "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11" (as a string)

=end

=begin
input: a string
output: a string

RULES
- Given a string of words
- Return a string where each char is replaced with its position in the alphabet
  - Ignore non letters

ALGORITHM
- Given a string of words
- Create an array of the alphabet and a range from 1-26
  - Get a hash from the two arrays where key is the char and value is the position in the alphabet
- Remove all non-letters (white-space, punctuation) from given string and transform to lowercase
- Iterate through each char for transformation
  - Get position of curr char in alphabet from the hash
- Join array back with spaces and return it
=end

def alphabet_position(str)
  alpha_ref = ('a'..'z').to_a.zip((1..26).to_a).to_h

  str.downcase.scan(/[a-z]/).map do |char|
    alpha_ref[char]
  end.join(' ')
end


p alphabet_position("The sunset sets at twelve o' clock.") #== "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"
p alphabet_position("-.-'") == ""
