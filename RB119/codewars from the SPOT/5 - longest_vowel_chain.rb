=begin
Difficulty: medium

The vowel substrings in the word codewarriors are o,e,a,io. The longest of these
has a length of 2. Given a lowercase string that has alphabetic characters only 
and no spaces, return the length of the longest vowel substring. Vowels are any 
of aeiou.

=end

=begin
input: a string
output: an integer

RULES
- Given a string
- Return the length of the longest vowel substring
  - Vowels are a, e, i, o, u

ALGORITHM
- Given a string
- Replace all non-vowel chars with white-space ' '
- Split string by white-space
- Return length of array

ALGORITHM
- Given a string
- Get an array of all contiguous vowel substrings
- Return length of array
=end

def solve(str)
  str.gsub(/[aeiou]+/, ' ').split.size
end

def solve(str)
  str.scan(/[aeiou]+/).size
end

p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvgheaae") == 4
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5
p solve("iiihoovaeaaaoougjyaw") == 8

# iterate to count