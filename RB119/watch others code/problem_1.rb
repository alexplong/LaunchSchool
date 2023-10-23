=begin
Given a non-empty string check if it can be constructed by taking a substring of
it and appending multiple copies of the substring together. You may assume the
given string consists of lowercase English letters only.
Example 1:
Input: "abab"
Output: True
Explanation: It's the substring "ab" twice.
Example 2:
Input: "aba"
Output: False
=end


=begin
Problem-
- input: a string
- output: a Boolean

Explicit/implicit requirements-
- input is non-empty
- lowercase letters only
- substring length is a multiple of input string length
- substring must start from beginning of input string

Clarifying questions-
-

Examples-
"abcabcabc" # can be constructed with "abc" * 3


Data Structures-
- Array: input
- Boolean: output
- Array: factors of input length

Algorithm-
- given a string as the input
- determine factors of string length (up to half the length) and store factors in an array
- iterate through array of factors
  - calculate multiple by dividing length by factor
  - obtain substring of input starting from index 0 with length of factor
  - return true if substring multiplied by multiple is equal to input
- return false if previous loop does not early return true

Determine factors helper method
- given an integer
- Iterate through values from 1 up to integer / 2
  - if integer % iterating value leaves zero remainder, append integer to an array
- return array of integers 
=end

def determine_factors(int)
  factors = []

  1.upto(int / 2) do |n|
    factors << n if int % n == 0
  end

  factors
end

def repeated_substring_pattern(string)
  factors = determine_factors(string.length)
  
  factors.each do |n|
    multiple = string.length / n
    return true if string.slice(0, n) * multiple == string
  end

  false
end

p repeated_substring_pattern("abab") == true
p repeated_substring_pattern("aba") == false
p repeated_substring_pattern("aabaaba") == false
p repeated_substring_pattern("abaababaab") == true
p repeated_substring_pattern("abcabcabc") == true