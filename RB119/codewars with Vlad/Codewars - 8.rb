=begin
Complete the function scramble(str1, str2) that returns true if a portion of str1 characters can be rearranged to match str2, otherwise returns false.

Notes:

    Only lower case letters will be used (a-z). No punctuation or digits will be included.
    Performance needs to be considered.

Examples

scramble('rkqodlw', 'world') ==> True
scramble('cedewaraaossoqqyt', 'codewars') ==> True
scramble('katas', 'steak') ==> False
=end


=begin
Input: two string inputs
Output: Boolean

RULES
Explicit:
- return true if portion of charactesr from str1 can be rearranged to match str2
- otherewise return false
- only lowercase letters used, no punc or digits

Implicit:
- if str1 size is less than str2 > return false

ALGORITHM
- Return false if str1.size < str2.size
- Given two strings as input
- Get a uniq array of characters from str2
- Iterate through uniq array (curr char)
  - Get count of curr char in str1 and str2 and compare them
  - Return false if count in str1 is less than str2
- true
=end

def scramble(str1, str2)
  return false if str1.size < str2.size
  str2_uniq = str2.chars.uniq

  str2_uniq.each do |curr_char|
    return false if str1.count(curr_char) < str2.count(curr_char)
  end

  true
end

p scramble('rkqodlw',           'world'     ) == (true)
p scramble('cedewaraaossoqqyt', 'codewars'  ) == (true)
p scramble('katas',             'steak'     ) == (false)
p scramble('scriptjava',        'javascript') == (true)
p scramble('scriptingjava',     'javascript') == (true)
## Time ~10 min