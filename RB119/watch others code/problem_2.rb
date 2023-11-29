=begin
Given an array of strings made only from lowercase letters, return an array of
all characters that show up in all strings within the given array (including
duplicates).
For example, if a character occurs 3 times in all strings but not 4 times, you
need to include that character three times in the final answer.
=end

=begin

# Problem
input: an array of strings
output: an array of characters

explicit/implicit requirements:
- strings in input array are only lowercase letters
- characters returned can be duplicates
  - if there are 3 strings 
  - two strings contain two `l` and last contains three `l`, then two `l` need to be included in returned array
- new array returned

questions?
- order of characters returned important? no

# Data Structure
- Array: input array - non mutated
- Array: output array containing characters
- Array: dictionary hash for each string, see ex. below

    [
      {"b" => 1, "e" => 1, "l" => 2, "a" => 1},
      {"l" => 2, "a" => 1, "b" => 1, "e" => 1},
      {"r" => 2, "o" => 1, "l" => 2, "e" => 1}
    ]

# Algorithm
- Given an array of strings
- Remove first string from array and split it into an array of chars
- Iterate through array of chars for selection
    - Iterate through array of strings
      - Replace current char in each element in input array with empty string destructively
- Return selected array
=end

def common_chars(arr)
  first_word = arr.shift.chars
  first_word.select do |char|
    arr.all? {|word| word.sub!(char, '')}
  end

end

p common_chars(["bella", "label", "roller"]) #== ["e", "l", "l"]
p common_chars(["cool", "lock", "cook"]) == ["c", "o"]
p common_chars(["hello", "goodbye", "booya", "random"]) == ["o"]
p common_chars(["aabbaaaa", "ccdddddd", "eeffee", "ggrrrrr", "yyyzzz"]) == []

