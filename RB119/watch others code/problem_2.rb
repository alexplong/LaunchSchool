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
- input strings array are only lowercase letters
- characters returned can be duplicates
- 3 strings and first two contain two `l` and last contains three `l`: two `l` need to be included in returned array
- new array returned

questions?
- order of characters returned important?

# Data Structure
- Array: input array - non mutated
- Array: output array containing characters
- Array: dictionary hash for each string

[
  {"b" => 1, "e" => 1, "l" => 2, "a" => 1},
  {"l" => 2, "a" => 1, "b" => 1, "e" => 1},
  {"r" => 2, "o" => 1, "l" => 2, "e" => 1}
]

# Algorithm
- Create an empty output array
- For each string in strings
- Create a dictionary and store each dictionary in a collection
- For each dictionary in dictionaries
  - Check if key in current dictionary is included in all dictionaries using helper function
    - If true, compare values associated with key from all dictionaries
    - Take minimum of all the values and multiply to key string
    - Append multiplied key string to output array
- Return output array

# tally_characters method
- Given a string
- For each character in string
  - Create key-value pair with value set to 1 if key does not exist
  - Otherwise update value associated with key by 1
- Return hash

# in_every_dictionary? method
- Given a collection containing dictionarys and element to check
- Iterate through every dictionary and check if element passed in is a key in every dictionary
- return true if it is otherwise return false
=end

def tally_characters(string)
  string.chars.each_with_object({}) do |char, hsh|
    if hsh[char] == nil
      hsh[char] = 1
    else
      hsh[char] += 1
    end
  end
end

def in_every_dictionary?(dictionary, character)
  dictionary.all? do |hsh|
    hsh.include?(character)
  end
end

def common_chars(arr)
  output = []
  dictionary = []
  arr.each {|word| dictionary << tally_characters(word)}

  dictionary.each do |hsh|

    hsh.each do |key, value|
      dictionary.select {|hsh| hsh.select {|k, v| }}
      in_every_dictionary(dictionary, key)
      
    end

  end

end

p common_chars(["bella", "label", "roller"]) == ["e", "l", "l"]
p common_chars(["cool", "lock", "cook"]) == ["c", "o"]
p common_chars(["hello", "goodbye", "booya", "random"]) == ["o"]
p common_chars(["aabbaaaa", "ccdddddd", "eeffee", "ggrrrrr", "yyyzzz"]) == []

