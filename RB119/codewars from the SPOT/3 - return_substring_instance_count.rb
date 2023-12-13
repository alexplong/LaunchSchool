=begin
Difficulty: medium

Complete the solution so that it returns the number of times the search_text
is found within the full_text.

Usage example:

solution('aa_bb_cc_dd_bb_e', 'bb') # should return 2 since bb shows up twice

solution('aaabbbcccc', 'bbb') # should return 1

=end

=begin
input: a pair of strings
output: an integer

RULES
- Given a string s and a pattern p
- Return count of p in s

ALGORITHM
- Given a string and a pattern
- Delete the pattern from the string
- Return the count determined by size of string - size of string after deletion, which is then divided by size of pattern

ALGORITHM
- Given a string and a pattern
- Get an array of pattern instances found in string
- Return size of array
=end

def solution(str, p)
  (str.size - str.gsub(p, '').size) / p.size
end

# def solution(s, p)
#   s.scan(p).size
# end

p solution('abcdeb','b') == 2
p solution('abcdeb', 'a') == 1
p solution('abbc', 'bb') == 1

# iterate to count