=begin
Difficulty: hard

Given two words, how many letters do you have to remove from them to make them anagrams?

Example
  First word : c [O] [D] e [W] a r [S] (4 letters removed)
  Second word : [H] [A] c [K] e [R] r a [N] [K] (6 letters removed)
Result : 10

Hints

- A word is an anagram of another word if they have the same letters (usually in a different 
  order).
- Do not worry about case. All inputs will be lowercase.

{
    "c" => 1,
X          "o" => 1,
X          "d" => 1,
    "e" => 1,
X          "w" => 1,
    "a" => 1,
    "r" => 1,
X          "s" => 1
}

c, e, a, r
a, c, e, r

{
X          "h" => 1,
X    "a" => 2,
    "c" => 1,
XX          "k" => 2,
    "e" => 1,
X    "r" => 2,
X           "n" => 1
}

Hints
- A word is an anagram of another word if they have the same letters (usually in a different 
  order).
- Do not worry about case. All inputs will be lowercase.

input: a pair of strings
output: an integer (count of letters removed to create anagrams of both strings)

RULES
- Given a pair of strings
- Count number of letters removed (from both strings) to create anagrams of each other
  - Do not worry about case

ALGORITHM
- Given a pair of strings
- Create a hash for each string where char is the key and count of char in given string is the value
- Create a variable count and set it to 0
- Iterate through hash of first string
  - Get value of curr key from hash of 2nd string
  - Next if value from hash1 is equal to value from hash2
  - If value from hash2 is nil
    - Increment count by value of curr key in hash1
    - Change value of curr key in hash1 to 0
  - If value from hash2 is different from value from hash1
    - vals = [hash1[key], hash2[key]]
    - find the absolute difference of the two values and increment count by this value
    - reassign value of key from hash1 and hash2 to the minimum value from vals array

- Iterate through hash of second string
  - Get value of curr key from hash of 1st string
  - Next if value from hash2 is equal to value from hash1
  - If value from hash1 is nil
    - Increment count by value of curr key in hash2
    - Change value of curr key in hash2 to 0
  - If value from hash1 is different from value from hash2
    - vals = [hash1[key], hash2[key]]
    - find the absolute difference of the two values and increment count by this value
    - reassign value of key from hash1 and hash2 to the minimum value from vals array
- Return count
=end

# def anagram_difference(str1, str2)
#   str1_count = str1.chars.tally
#   str2_count = str2.chars.tally
#   count = 0

#   str1_count.each do |key, val1|
#     val2 = str2_count[key]

#     if val1 == val2
#       next
#     elsif val2.nil?
#         count += val1
#         str1_count[key] = 0
#     else
#       vals = [val1, val2]
#       count += (val1 - val2).abs
#       str1_count[key], str2_count[key] = [vals.min, vals.min]
#     end
#   end

#   str2_count.each do |key, val2|
#     val1 = str1_count[key]

#     if val1 == val2
#       next
#     elsif val1.nil?
#         count += val2
#         str2_count[key] = 0
#     else
#       vals = [val1, val2]
#       count += (val1 - val2).abs
#       str1_count[key], str2_count[key] = [vals.min, vals.min]
#     end
#   end

#   count
# end

=begin
'codewars' 'hackerrank'
 x..x.xx.   -xx-xx----       
=end

def anagram_difference(str1, str2)
  str1.dup.each_char do |char|
    if str1.include?(char) && str2.include?(char)
      str1.sub!(char, '')
      str2.sub!(char, '')
    end
  end

  str1.size + str2.size
end

p anagram_difference('', '') == 0
p anagram_difference('a', '') == 1
p anagram_difference('', 'a') == 1
p anagram_difference('ab', 'a') == 1
p anagram_difference('ab', 'ba') == 0
p anagram_difference('ab', 'cd') == 4
p anagram_difference('aab', 'a') == 2
p anagram_difference('a', 'aab') == 2
p anagram_difference('codewars', 'hackerrank') == 10


## Vlad solution
=begin
Input: two strings
Output: an integer

Rules:
  - given two strings
  - return a count of letters that needs to be removed to create an anagram

Algorithm:
  - given two strings
  - convert the first word into an array of characters and interate through
    - if the current character is in both strings
      - destructively substitute the first instance of it on both strings
  - retrurn the sum of the count of this strings
=end


# def anagram_difference(str1, str2)
#   str1.chars.each do |char|
#     if str1.include?(char) && str2.include?(char)
#       str1.sub!(char, '')
#       str2.sub!(char, '')
#     end
#   end
#   p str1
#   p str2
#   str1.size + str2.size
# end