=begin
Difficulty: easy

Complete the function scramble(str1, str2) that returns true if a portion 
of str1 characters can be rearranged to match str2, otherwise returns false.

Notes:

- Only lower case letters will be used (a-z). No punctuation or digits will be included.
- Performance needs to be considered
- Input strings s1 and s2 are null terminated. ??

=end

=begin
input: a pair of strings
output: a boolean

RULES
- Given a pair of strings
- Return true if 2nd str can be formed from 1st string
- Else return false

ALGORITHM
- Iterate through string2
  - Substitute first instance of curr char in string1
  - Return false early if substitution cannot be made
- Return true
=end

def scramble(str1, str2)
  str2.each_char do |c|
    return false if str1.sub!(c, '').nil?
  end
  
  true
end

p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('rkqodlw','world') == true
p scramble('cedewaraaossoqqyt','codewars') == true
p scramble('katas','steak') == false
p scramble('scriptjava','javascript') == true
p scramble('scriptingjava','javascript') == true
