=begin
Difficulty: medium

For a given nonempty string s find a minimum substring t and the maximum number k,
such that the entire string s is equal to t repeated k times. The input string 
consists of lowercase latin letters. 

Your function should return an array (in Ruby and JavaScript) [t, k]

Example #1:
s = "ababab"
the answer is ["ab", 3]

Example #2:
s = "abcde" the answer is ["abcde", 1]

this string "abcde" the minimum substring t, such that s is t repeated k times, is itself.

=end

p f("ababab") == ["ab", 3]
p f("abcde") == ["abcde", 1]
