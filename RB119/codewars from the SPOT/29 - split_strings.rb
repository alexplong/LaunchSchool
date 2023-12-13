=begin
Difficulty: medium

Complete the solution so that it splits the string into pairs of two characters. 
If the string contains an odd number of characters then it should replace the 
missing second character of the final pair with an underscore ('_').

input: a string
output: an array

RULES
- Given a string
- Split the string into pairs of two chars
  - If the string length is odd, replace missing 2nd char of final pair with an underscore '_'
- Empty strings should return an empty array

ALGORITHM
- Given a string
- Create a variable counter and set it to 0
- Create a variable result and set it to an empty array
- Initialize a loop while counter < size of input string
  - Get the substr from index position counter with a length of 2
  - If substr is length 1, append underscore to substr
  - Append substr to result array
  - Increment counter by 2
- Return the result
=end

def solution(str)
  # counter, result = [0, []]

  # while counter < str.size
  #   substr = str[counter, 2]

  #   substr << '_' if substr.size == 1
  #   result << substr

  #   counter += 2
  # end

  # result

  str << '_' if str.size.odd?

  str.scan(/[a-z_]{2}/i)

  # result = []
  # str.chars.each_slice(2) {|substr| result << substr.join}
  # result
end

p solution('abc') #== ['ab', 'c_']
p solution('abcdef') == ['ab', 'cd', 'ef']
p solution("abcdef") == ["ab", "cd", "ef"]
p solution("abcdefg") == ["ab", "cd", "ef", "g_"]
p solution("") == []
