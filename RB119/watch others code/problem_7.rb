=begin
Write function scramble(str1, str2) that returns true if a portion of str1
characters can be rearranged to match str2, otherwise returns false.
For example:
str1 is 'rkqodlw' and str2 is 'world' the output should return true.
str1 is 'cedewaraaossoqqyt' and str2 is 'codewars' should return true.
str1 is 'katas' and str2 is 'steak' should return false.
Only lower case letters will be used (a-z). No punctuation or digits will be
included.

# Problem
- input: two strings
- output: Boolean

requirements/questions?
- only lowercase
- no punctuation or digits
- return true if str1 contains characters that can be rearranged to match str2

mental model
- create a dictionary for str1 and str2
- check if key from str2 is included in str1 and if value for key in str1 is >= value from str2
- if all keys from str2 dictionary passes that condition then return true
- otherwise return false if a key from str2 is not found in str1 dictionary

# Examples
- all return true

# Data Structure
- Strings: input
- Hash: dictionary for each string input

# Algorithm
- Given two strings: str1 and str2 as input
- Create a dictionary for each downcased string
- Iterate through str2 dictionary 
  - Check if key is in str1 dictionary and str1 value for key is greater than or equal to str2 key value
  - return false if key is not found

# Code with Intent

=end


def scramble(str1, str2)
  str1_dictionary = str1.downcase.chars.tally
  str2_dictionary = str2.downcase.chars.tally

  str2_dictionary.each do |k, v|
    return false unless str1_dictionary.include?(k) && str1_dictionary[k] >= v
  end

  true

end

p scramble('javaass', 'jjss') == false
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true

## time 20 min