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
- Create an empty output array
- For each string in strings
-   Create a tally of each word and store in a dictionary
- For each word in dictionary
  - Check if key is not in output AND is included in every hash in the dictionary
    - If true, get all values for the key in from every hash in the dictionary
    - Determine minimum of all those values
    - Append key string to output array the minimum number of times
- Return output array

# tally_characters method
- Given a string
- For each character in string
  - Create key-value pair with value set to 1 if key does not exist
  - Otherwise update value associated with key by 1
- Return hash

# in_every_dictionary? method
- Given a collection containing array of hash elements and key to check in every hash
- Iterate through every dictionary and check if element passed in is a key in every dictionary
- return true if it is otherwise return false

# all_values_of_key method
- Given an array of hashes and a hash key
- Each hash in array
  - Append value associated with key to array
- Return array of values

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

def all_values_of_key(dictionary, key)
  dictionary.each_with_object([]) do |hsh, character_count|
    character_count << hsh[key]
  end
end

def common_chars(arr)
  output = []
  dictionary = []
  arr.each {|word| dictionary << tally_characters(word)}

  dictionary.each do |hsh|
    hsh.each do |key, value|

      if !output.include?(key) && in_every_dictionary?(dictionary, key)
        character_count = all_values_of_key(dictionary, key).min

        character_count.times do
          output << key
        end

      end
    end

  end
  output
end

p common_chars(["bella", "label", "roller"]) == ["e", "l", "l"]
p common_chars(["cool", "lock", "cook"]) == ["c", "o"]
p common_chars(["hello", "goodbye", "booya", "random"]) == ["o"]
p common_chars(["aabbaaaa", "ccdddddd", "eeffee", "ggrrrrr", "yyyzzz"]) == []

