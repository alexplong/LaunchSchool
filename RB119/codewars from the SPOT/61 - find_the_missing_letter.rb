=begin
Difficulty: medium

Write a method that takes an array of consecutive (increasing) letters as 
input and that returns the missing letter in the array.

You will always get an valid array. And it will be always exactly one letter 
be missing. The length of the array will always be at least 2.

The array will always contain letters in only one case.

Example:

['a','b','c','d','f'] -> 'e' ['O','Q','R','S'] -> 'P'

["a","b","c","d","f"] -> "e"
["O","Q","R","S"] -> "P"

(Use the English alphabet with 26 letters!)

Input: an array of chars
Output: a string

RULES
- given an array of consecutive (increasing) letters (sorted)
- find missing letter in sorted array and return it
- a valid array is always given with exactly ONE letter missing
- length of arr will always be at least 2
- array will either be all upcase or all downcase letters
Implicit:
- 

DATA STRUCTURES
- 1 Array: input
- 1 String: output
- 1 Array: reference of chars

MENTAL MODEL
- iterate through the input array
  - get the index of curr char from reference and index of next char from reference
  - if difference of curr char and next char index is NOT 1, then next char is "missing"

ALGORITHM
- Create a reference array of the alphabet downcase
- Given an array of chars
- Iterate through each char with index
  - Get index of downcase curr char from alphabet reference 
  - Get index of downcase next char from alphabet reference
  - Check difference of those two indexes
    - If NOT equal to 1
      - Get index of curr char from alphabet reference
      - Then return the char from alphabet reference from prev return + 1
        - Match the case of return with input chars
=end

def find_missing_letter(arr)
  letters = ('a'..'z').to_a

  arr.each_with_index do |char, idx|
    curr_char_idx = letters.index(char.downcase)
    next_char_idx = letters.index(arr[idx + 1].downcase)

    if next_char_idx - curr_char_idx != 1
      if letters.include?(arr.first)
        return letters[curr_char_idx + 1]
      else
        return letters[curr_char_idx + 1].upcase
      end
    end
  end

end





p find_missing_letter(["a","b","c","d","f"]) #== "e"
p find_missing_letter(["O","Q","R","S"]) == "P"
p find_missing_letter(["b","d"]) == "c"
p find_missing_letter(["a","b","d"]) == "c"
p find_missing_letter(["b","d","e"]) == "c"

def find_missing_letter(arr)
  ((arr.first..arr.last).to_a - arr).first
end