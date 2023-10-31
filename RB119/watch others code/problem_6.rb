require "pry"
=begin
Given 2 strings, your job is to find out if there is a substring that appears in
both strings. You will return true if you find a substring that appears in both
strings, or false if you do not. We only care about substrings that are longer
than one letter long.

# Problem
- input: two strings as input
- output: a Boolean

Requirements or Clarifying Questions?
- find common substring among both strings
- substrings must be longer than 1 char
- Does case count? case does not matter

Mental Model
- compile a list of substrings for each string
- check if common elements between two list of substrings
- return true as soon as there is a match
- return false as we iterate through all combinations and find no match

# Examples
- All tests to return true

# Data Structures
- Strings: input
- Booleans: output
- Array: collection of substrings from strings

# Algorithm
- Given two strings as input
- For each string
  - Get an array containing all substrings of string
- Iterate through all substrings from first string
  - Return true if current substring is included in second substring array
- otherwise false is returned if iteration completes and no condition leads to early return

get_substrings method
- Create an empty array and store it in an output variable
- Iterate through string with index
  - Create a pointer that points to last character in string
  - While pointer to last character is greater than current index
    - Transform and append downcase substring from range (current_index..last) to output array
    - Decrement last by 1
- Return unique output array


# Code with Intent!
=end

# def get_substrings(str)
#   substrings = []

#   str.chars.each_index do |idx|
#     last = str.size - 1

#     while idx < last
#       substrings << str[idx..last].downcase
#       last -= 1
#     end
#   end

#   substrings.uniq
# end

def get_substrings(str)
  str = str.chars

  str.each_index.each_with_object do |idx, substrings|
    str.permutation(idx) do |substring| 

      substrings << substring if substrings.include?(substring.join)

    end
  end
end

def substring_test(str1, str2)
  substrings1, substrings2 = get_substrings(str1), get_substrings(str2)

  substrings1.each do |substring|
    return true if substrings2.include?(substring)
  end

  false
end

p substring_test('Something', 'Fun') == false
p substring_test('Something', 'Home') == true
p substring_test('Something', '') == false
p substring_test('', 'Something') == false
p substring_test('BANANA', 'banana') #== true
p substring_test('test', '111t') == false
p substring_test('', '') == false
p substring_test('1234567', '541265') == true
p substring_test('supercalifragilisticexpialidocious', 'SoundofItIsAtrociou') == true

## time 30+