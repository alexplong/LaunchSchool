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

# Problem
- input: an array of strings
- output: a string 

Requirements or Clarifying Questions?
- return empty string if no common prefix
- Does case matter? all inputs are in lowercase

# Examples
- all should return true

# Data Structures
- Array: input
- String: output - common prefix among all strings in input array

# Algorithm
- Create variable with empty string as output
- For each string in the array
  - For each character in string
    - Compare character at current index position against all strings
    - If true, add character to output
    - Break out of loop if false
- Return output 
=end

def common_prefix(arr)

  arr.each_with_object("") do |string, output|
    
    string.chars.each_with_index do |char, index|
      if arr.all? {|str| str[index] == char}
        output << char 
      else
        break 
      end
    end
    break output
  end
end


p common_prefix(["flower", "flow", "flight"]) == "fl"
p common_prefix(["dog", "racecar", "car"]) == ""
p common_prefix(["interspecies", "interstellar", "interstate"]) == "inters"
p common_prefix(["throne", "dungeon"]) == ""
p common_prefix(["throne", "throne"]) == "throne"

## time 18 min