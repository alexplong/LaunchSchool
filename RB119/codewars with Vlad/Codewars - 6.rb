=begin
For a given nonempty string s find a minimum substring t and the maximum number k, such that the entire string s is equal to t repeated k times.

The input string consists of lowercase latin letters.

Your function should return :

    an array [t, k] (in Ruby and JavaScript)

Examples:

"ababab" ---> (t = "ab", k = 3)

"abcde" ---> (t = "abcde", k = 1)
because for this string, the minimum substring 't'
such that 's' is 'k' times 't', is 's' itself.
=end


=begin
Input: a non empty string
Output: a two element array

RULES
Explicit:
- input is non empty
- input string is lowercase only
- s = t * k

Implicit:

ALGORITHM
- Given a string as input
- Get an array of characters from string
- Iterate through array of chars with index (end_idx)
  - Get substring from range 0..end index inclusive
  - Get k by dividing length of input string by length of substring
  - If substring * k is equal to input string
    - If true, return an array [substring, k]

=end

def f(str)
  str.chars.each_index do |end_idx|
    substr = str.slice(0..end_idx)
    k = str.length / substr.length
    return [substr, k] if substr * k == str
  end
end

p f("ababab") == ["ab", 3]
p f("abcde") == ["abcde", 1]
## 12 min
# optimize by returning str and 1 early if end_idx is > str.length / 2