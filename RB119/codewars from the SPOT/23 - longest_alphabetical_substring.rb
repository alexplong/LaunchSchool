=begin
Difficulty: medium

Find the longest substring in alphabetical order.

Example: 
the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" is "aaaabbbbctt".

Notes
- There are tests with strings up to 10 000 characters long so your code will need to be efficient.
- The input will only consist of lowercase characters and will be at least one letter long.
- If there are multiple solutions, return the one that appears first.


input: a string
output: a string

RULES
- Given a string (at least 1 char long)
- Find and return the longest substring that is in alphabetical order
  - Only lowercase chars in the input
  - Return the first substring if there are multiple solutions

DATA STRUCTURE
String: input
String: output - result variable

ALGORITHM - nested iteration problem with dynamic programming
- Given a string
- Create a result variable and set it to an empty string
- Get a range from 0 to length of input string exclusively for iteration (start_idx)
  - Get a range from start_idx to length of input string exclusively for iteration (end_idx)
    - Get a substring from range start_idx to end_idx inclusively
    - Check if substring is equal to its sorted version
    - If true and substring length is greater than length of result
      - Reassign result to this current substring
- Return result
=end

def longest(str)
  result = ''

  (0...str.size).each do |start_idx|
    (start_idx...str.size).each do |end_idx|
      substr = str[start_idx..end_idx]
      result = substr if substr == substr.chars.sort.join && substr.size > result.size
    end
  end

  result
end

p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') == 'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') =='fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'


# EXAMPLE:

# 'asdfaaaabbbbcttavvfffffdf' -> initial string
# DS -> ['a', 'as']

# 'a'
# 'as'

# 'asd' -> not alphabet order (break condition)

# 'dfaaaabbbbcttavvfffffdf' -> updated string
# DS -> ['d', 'df']

# 'd'
# 'df'
# 'dfa' -> not alphabet order (break condition)

# 'aaaabbbbcttavvfffffdf' -> updated string
# DS -> ['a', 'aa', 'aaa', 'aaaa', 'aaaab' ...]

# 'a'
# 'aa'
# 'aaa'
# 'aaaa'
# 'aaaab'
# 'aaaabb'
# 'aaaabbb'
# 'aaaabbbb'
# 'aaaabbbbc'
# 'aaaabbbbct'
# 'aaaabbbbctt'
# 'aaaabbbbctta' -> not alphabet order (break condition)

# 'avvfffffdf' - break, because the length of the rest is less than the longest substring

=begin
ALGORITHM - 
- Given a string
- Create result and set to empty string
- While string is not empty or substring result length is greater than length of the string
  - Get the alphabetical substring from given the string (str)
  - Reassign result to the substr if substr length is greater length of the result
  - Reassign input string to new string where substr is removed from the input string
- Return the result
  
GET ALPHA SUBSTR -      
- Create a variable temp_substr and set to an empty array
- Iterate through the given string using range from 0 to size of str exclusively (end_idx)
  - Get substring from range 0 to end_idx inclusively
  - If substr is in alphabetyical order
    - Push substr to temp_substr array 
  - Else
    - Break when the substring is no longer in alphabetical order
- Return the last element temp_substr array
=end

def alpha_substr(str)
  substr = ''

  (0...str.size).each do |end_idx|
    current_substr = str[0..end_idx]
    sorted_substr = current_substr.chars.sort.join

    if current_substr == sorted_substr && current_substr.size > substr.size
      substr = current_substr
    else
      break
    end
  end

  substr
end

def longest(str)
  # result = ''

  # (0...str.size).each do |start_idx|
  #   (start_idx...str.size).each do |end_idx|
  #     substr = str[start_idx..end_idx]
  #     result = substr if substr == substr.chars.sort.join && substr.size > result.size
  #   end
  # end

  # result
  result = ''

  until str.empty? || str.size < result.size
    current_substr = alpha_substr(str)
    result = current_substr if current_substr.size > result.size
    str = str.sub(current_substr, '')
  end

  result
end
