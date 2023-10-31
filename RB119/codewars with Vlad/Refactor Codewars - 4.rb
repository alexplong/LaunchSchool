=begin
The vowel substrings in the word codewarriors are o,e,a,io. The longest of these has a length of 2. Given a lowercase string that has alphabetic characters only (both vowels and consonants) and no spaces, return the length of the longest vowel substring. Vowels are any of aeiou.

Good luck!
=end

=begin
- input: a string
- output: an integer

rules/questions?
- get substring made only of vowels
- return length of longest vowel substring
- string lowercase only with no spaces
- vowels are aeiou

examples -
"abeaciouae" # 5

data structure
-

algorithm
- given a string



=end


p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvgheaae") == 4
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5
p solve("iiihoovaeaaaoougjyaw") == 8
