=begin
Difficulty: ___

Sort the given strings in alphabetical order, case insensitive. 

For example:

["Hello", "there", "I'm", "fine"]  -->  ["fine", "Hello", "I'm", "there"]
["C", "d", "a", "B"])              -->  ["a", "B", "C", "d"]

=end

=begin
input: an array
output: an array

RULES
- Given an array of strings
- Return the sorted array

ALGORITHM
- Iterate through the array of strings
  - Sort pairs of words by the downcase form
- Return that sorted array
=end

def sortme(arr)
  arr.sort do |a, b|
    a.downcase <=> b.downcase
  end
end

p sortme(["Hello", "there", "I'm", "fine"]) == ["fine", "Hello", "I'm", "there"]
p sortme(["C", "d", "a", "Ba", "be"]) == ["a", "Ba", "be", "C", "d"]
p sortme(["CodeWars"]) == ["CodeWars"]
