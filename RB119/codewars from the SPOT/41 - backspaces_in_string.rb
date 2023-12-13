=begin
Difficulty: medium

Assume "#" is like a backspace in string. This means that string "a#bc#d" 
actually is "bd"

Your task is to process a string with "#" symbols.

Examples

  "abc#d##c"      ==>  "ac"
  "abc##d######"  ==>  ""
  "#######"       ==>  ""
  ""              ==>  ""


input: a string
output: a new string

RULES
- Given a string that contains '#'
- Process the string so that each '#' acts like a backspace
- Return the new processed string

ALGORITHM
- Given a string
- Create a variable result and set it to an empty array
- Iterate through each char in the given string
  - If curr char is a letter 
    - Remove the last element from the result array
  - Else
    - Push curr char to the result array
- Join the result array and return that string
=end

def clean_string(str)
  result = []

  str.each_char do |char|
    if char == '#'
      result.pop
    else
      result.push(char)
    end
  end

  result.join
end

p clean_string('abc#d##c') == "ac"
p clean_string('abc####d##c#') == ""
