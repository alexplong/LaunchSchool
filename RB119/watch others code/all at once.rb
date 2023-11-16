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
PROBLEM
- Input: a String
- Output: a Boolean

Rules
- Explicit:
  - Input string is non-empty
  - Check if input String can be constructed by taking substring and appending multiple copies of it together
  - String contains only lowercase letters
  - Return true if input String can be constructed when substrings appended together
- Implicit:
  - Self multiplied once does not count as substring

EXAMPLE
Input: "aba"
"aba" x 1 = "aba" false since self does not count as a substring

Input: "ababab"
"ab" x 3 = "ababab" true

DATA STRUCTURE
- 1 String: input
- 1 String: variable container for prefix substring
- 1 Integer: factor of String length

ALGORITHM
- Given a String as input
- Iterate through String with index
  - Break out of loop when the curr index is equal or greater than half of length of input String
  - Get substring from index 0 to curr index inclusive
  - Get multiple by dividing length of input String by length substr
  - Return true if substring times multiple is equal to input String
- Return false
=end

# def repeated_substring_pattern(str)
#   str.chars.each_index do |idx|
#     break if idx == str.size / 2
#     substr = str.slice(0..idx)
#     multiple = str.size / substr.size
#     return true if substr * multiple == str
#   end
#   false
# end

# p repeated_substring_pattern("abab") == true
# p repeated_substring_pattern("aba") == false
# p repeated_substring_pattern("aabaaba") == false
# p repeated_substring_pattern("abaababaab") == true
# p repeated_substring_pattern("abcabcabc") == true
## 15 min



################################################################################
=begin
Given an array of strings made only from lowercase letters, return an array of
all characters that show up in all strings within the given array (including
duplicates).
For example, if a character occurs 3 times in all strings but not 4 times, you
need to include that character three times in the final answer.
=end

=begin
PROBLEM
- Input: an Array of strings
- Output: an Array of characters or empty Array

Rules
- Explicit:
  - Given an Array of strings
  - Strings are only composed of lowercase letters
  - If all strings in Array have at least 2 of same letter, new Array should have letter included twice in it
- Implicit:
  - If no letters are shared, return an empty Array

EXAMPLES
["abc", "def", "hij"]         # => []
["abc", "deb", "bij"]         # => ["b"]
["abbbc", "bbdeb", "bijbbbb"] # => ["b", "b", "b"]

DATA STRUCTURE
- 1 Array: input
- 1 Array: output


MENTAL MODEL
- Store 1st word in a first variable
- Iterate through uniqued 1st word
  - Iterate through all words of input Array and check if curr char is included in all of them
    - If true, get the minimum count k of curr char from given strings in Array
    - Push curr char to output Array k times

ALGORITHM
- Initialize an output variable and set to empty Array
- Given an Array of strings
- Create a first word variable and set it to first element of input Array
- Transform string in first word variable to an Array of unique characters
- Each char in first word string Array
  - Initialize a key values Array and set to empty
  - Iterate through all strings in input Array to check if all strings contain char
    - Push count of curr char in curr word to key values Array
    - Check if curr word contains curr char
  - If all are true, get minimum value (k) from key values array
    - For k times, append curr char to output Array k times
- Return output Array

=end

def common_chars(arr)
  output = []
  first_word = arr.first.chars.uniq

  first_word.each do |char|
    key_values = []

    all_true = arr.all? do |word| 
                 key_values << word.count(char)
                 word.include?(char) 
               end

    if all_true
      k = key_values.min
      k.times { |_| output << char }
    end
  end

  output

end

p common_chars(["bella", "label", "roller"]) == ["e", "l", "l"]
p common_chars(["cool", "lock", "cook"]) == ["c", "o"]
p common_chars(["hello", "goodbye", "booya", "random"]) == ["o"]
p common_chars(["aabbaaaa", "ccdddddd", "eeffee", "ggrrrrr", "yyyzzz"]) == []
# 40 min



################################################################################
=begin
You have to create a method that takes a positive integer number and returns
the next bigger number formed by the same digits:
12 ==> 21
513==> 531
2017==> 2071
If no bigger number can be composed using those digits, return -1:
9 ==> -1
111 ==> -1
531 ==2 -1
=end


# p next_bigger_num(9) == -1
# p next_bigger_num(12) == 21
# p next_bigger_num(513) == 531
# p next_bigger_num(2017) == 2071
# p next_bigger_num(111) == -1
# p next_bigger_num(531) == -1
# p next_bigger_num(123456789) == 123456798
# p next_bigger_num(54681)
# p next_bigger_num(54618)




################################################################################
=begin
The maximum sum subarray problem consists of finding the maximum sum of a
contiguous subsequence in an array of integers:
maxSequence [-2, 1, -3, 4, -1, 2, 1, -5, 4) --> should be 6: [4, -1, 2, 1]

Easy case is when the array is made up of only positive numbers and the maximum
sum is the sum of the whole array. 

If the array is made up of only negative numbers, return 0 instead.

Empty array is considered to have zero greatest sum, Note that the empty array
is also a valid subarray.
=end


# p max_sequence([]) == 0
# p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
# p max_sequence([11]) == 11
# p max_sequence([-32]) == 0
# p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12




################################################################################
=begin
Write a method to find the longest common prefix string amongst an array of
strings. If there is no common prefix, return an empty string "".
Example 1:
Input: ["flower", "flow", "flight"]
Output: "f1"
Example 2:
Input: ["dog", "racecar", "car"]
Output: ""
Explanation: There is no common prefix among the input strings.
Note: All given inputs are in lowercase letters a-z.
=end


# p common_prefix(["flower", "flow", "flight"]) == "fl"
# p common_prefix(["dog", "racecar", "car"]) == ""
# p common_prefix(["interspecies", "interstellar", "interstate"]) == "inters"
# p common_prefix(["throne", "dungeon"]) == ""
# p common_prefix(["throne", "throne"]) == "throne"




################################################################################
=begin
Given 2 strings, your job is to find out if there is a substring that appears in
both strings. You will return true if you find a substring that appears in both
strings, or false if you do not. We only care about substrings that are longer
than one letter long.
=end


# p substring_test('Something', 'Fun') == false
# p substring_test('Something', 'Home') == true
# p substring_test('Something', '') == false
# p substring_test('', 'Something') == false
# p substring_test('BANANA', 'banana') == true
# p substring_test('test', '111t') == false
# p substring_test('', '') == false
# p substring_test('1234567', '541265') == true
# p substring_test('supercalifragilisticexpialidocious', 'SoundofItIsAtrociou') == true




################################################################################
=begin
Write function scramble(str1, str2) that returns true if a portion of str1
characters can be rearranged to match str2, otherwise returns false.
For example:
str1 is 'rkqodlw' and str2 is 'world' the output should return true.
str1 is 'cedewaraaossoqqyt' and str2 is 'codewars' should return true.
str1 is 'katas' and str2 is 'steak' should return false.
Only lower case letters will be used (a-z). No punctuation or digits will be
included.
=end


# p scramble('javaass', 'jjss') == false
# p scramble('rkqodlw', 'world') == true
# p scramble('cedewaraaossoqqyt', 'codewars') == true
# p scramble('katas', 'steak') == false
# p scramble('scriptjava', 'javascript') == true
# p scramble('scriptingjava', 'javascript') == true




################################################################################
=begin
Find the length of the longest substring in the given string that is the same in
reverse.
As an example, if the input was "I like racecars that go fast", the substring
(racecar) length would be 7.
If the length of the input string is 0, return value must be 0.
Example:
"а" -> 1
"aab" -> 2
"abcde" -> 1
"zzbaabcd" -> 4
"" -> 0
=end


# p longest_palindrome("a") == 1
# p longest_palindrome("aa") == 2
# p longest_palindrome("baa") == 2
# p longest_palindrome("aab") == 2
# p longest_palindrome("baabcd") == 4
# p longest_palindrome("baablkj12345432133d") == 9




################################################################################
=begin
You are going to be given an array of integers. Your job is to take that array
and find an index N where the sum of the integers to the left of N is equal to
the sum of the integers to the right of N. If there is no index that would make
this happen, return -1.
For example:
Let's say you are given the array [1, 2, 3, 4, 3, 2, 1]:
Your method will return the index 3, because at the 3rd position of the array,
the sum of left side of the index [1, 2, 3] and the sum of the right side of the
index [3, 2, 1] both equal 6.
Another one:
You are given the array [20, 10, -80, 10, 10, 15, 35]
At index 0 the left side is []
The right side is [10, -80, 10, 10, 15, 35]
They both are equal to 0 when added. (Empty arrays are equal to 0 in this problem)
Index 0 is the place where the left side and right side are equal.
=end


p find_even_index([1, 2, 3, 4, 3, 2, 1]) == 3
p find_even_index([1, 100, 50, -51, 1, 1]) == 1 
p find_even_index([1, 2, 3, 4, 5, 6]) == -1
p find_even_index([20, 10, 30, 10, 10, 15, 35]) == 3
p find_even_index([20, 10, -80, 10, 10, 15, 35]) == 0
p find_even_index([10, -80, 10, 10, 15, 35, 20]) == 6
p find_even_index([-1, -2, -3, -4, -3, -2, -1]) == 3