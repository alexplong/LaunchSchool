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
- Array: divisors of input length

Algorithm-
- given a string as the input
- determine divisors of string length (up to half the length) and store divisors in an array
- iterate through array of divisors
  - calculate multiple by dividing length by factor
  - obtain substring of input starting from index 0 with length of factor
  - return true if substring multiplied by multiple is equal to input
- return false if previous loop does not early return true

Determine divisors helper method
- given an integer
- Iterate through values from 1 up to integer / 2
  - if integer % iterating value leaves zero remainder, append integer to an array
- return array of integers 
=end

def determine_divisors(int)
  (1..int/2).to_a.select do |num|
    int % num == 0
  end
end

def repeated_substring_pattern(string)
  divisors = determine_divisors(string.length)
  
  divisors.each do |n|
    multiple = string.length / n
    return true if string.slice(0, n) * multiple == string
  end

  false
end

=begin
Revisit & Refactor
determine_divisors helper method
- method to get all divisors? none that I could find
- update algorithm
  - get an array of integers from 1 up to input
  - iterate through array to filter
    - check if input divided by curr integer == 0
  - return all elements that return true from prev conditional
=end



p repeated_substring_pattern("abab") == true
p repeated_substring_pattern("aba") == false
p repeated_substring_pattern("aabaaba") == false
p repeated_substring_pattern("abaababaab") == true
p repeated_substring_pattern("abcabcabc") == true