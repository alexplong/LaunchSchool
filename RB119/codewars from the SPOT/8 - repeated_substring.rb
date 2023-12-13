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

=begin
input: a string
output: a 2-element array

RULES
- Given a non-empty string, s
- Find the minimum substring, t, from s
- Find the maximum number k, which s = t * k
- Return [t, k]

Implicit:
- Substring must start from index 0

ALGORITHM
- Given a string
- Iterate from 0 to length of string exclusively - end_idx
  - Get substring from 0 to end_idx inclusively
  - Check if substring * string size/substring size is equal to string
  - Return substring and string size/substring size in a 2-element array
=end

def f(str)
  (0...str.size).each do |end_idx|
    substr = str[0..end_idx]
    return [substr, str.size/substr.size] if substr * (str.size/substr.size) == str
  end
end


p f("ababab") == ["ab", 3]
p f("abcde") == ["abcde", 1]

# Iterate to find a match