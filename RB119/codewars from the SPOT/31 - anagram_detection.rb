=begin
Difficulty: easy

An anagram is the result of rearranging the letters of a word to produce a 
new word (see wikipedia).

Note: anagrams are case insensitive

Complete the function to return true if the two arguments given are anagrams 
of each other; return false otherwise.

Examples

  "foefet" is an anagram of "toffee"

  "Buckethead" is an anagram of "DeathCubeK"
  
input: two strings
output: a Boolean

RULES
- Given a pair of strings
- Return if the two strings are anagrams of each other
  - Anagrams are case insensitive

DATA STRUCTURE
- 2 Hashes: count of chars in given string

ALGORITHM
- Given a pair of strings
- Get a hash for each downcased string after conversion to an array that consists of:
  - lowercase char for the key and the count in the given string as the value
- Compare the two hashes 
- Return true if they are the same otherwise return false
=end

def is_anagram(str1, str2)
  # str1_count = str1.downcase.chars.tally
  # str2_count = str2.downcase.chars.tally

  # str1_count == str2_count

  str1.downcase.chars.sort == str2.downcase.chars.sort
end

p is_anagram('Creative', 'Reactive') == true
p is_anagram("foefet", "toffee") == true
p is_anagram("Buckethead", "DeathCubeK") == true
p is_anagram("Twoo", "WooT") == true
p is_anagram("dumble", "bumble") == false
p is_anagram("ound", "round") == false
p is_anagram("apple", "pale") == false
