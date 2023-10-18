=begin
Given non empty string check if it can be constructed by taking a substring of it an appending multiple copies of substring together. Assume given string consists of lowercase English letters only.
Example 1: 
Input: 'abab'
Output: true 
Explanation: It's the substring 'ab' twice.
Example 2: 
Input: 'aba'
Output: false
Explanation: String cannot be constructed from repeating substring. 
p repeated_substring_patten('abab') == true
p repeated_substring_patten('aba') == false
p repeated_substring_patten('aabaaba') == false
p repeated_substring_patten('abaababaab') == true 
p repeated_substring_patten('abcabcabcabc') == true 

Explicit/Implicit:
- substring is prefix and should begin from index 0
- prefix substring at most is half the string
  - a substring of half and not a prefix can immediately return false
- substrings also need to be a common denominator of string length limiting amount of recursion/dynamic programming to look up substrings

- Given a string `str` as input
- 

=end 

def repeated_substring_patten(str)


end