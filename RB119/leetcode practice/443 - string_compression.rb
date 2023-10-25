=begin

Given an array of characters chars, compress it using the following algorithm:
  Begin with an empty string s. For each group of consecutive repeating characters in chars:

  If the group's length is 1, append the character to s.
  Otherwise, append the character followed by the group's length.

  The compressed string s should not be returned separately, but instead, be stored in the input character array chars. 
Note that group lengths that are 10 or longer will be split into multiple characters in chars.

After you are done modifying the input array, return the new length of the array.
You must write an algorithm that uses only constant extra space.

Constraints:

1 <= chars.length <= 2000
chars[i] is a lowercase English letter, uppercase English letter, digit, or symbol.

Example 1:
Input: chars = ["a","a","b","b","c","c","c"]
Output: Return 6, and the first 6 characters of the input array should be: ["a","2","b","2","c","3"]
Explanation: The groups are "aa", "bb", and "ccc". This compresses to "a2b2c3".

Example 2:
Input: chars = ["a"]
Output: Return 1, and the first character of the input array should be: ["a"]
Explanation: The only group is "a", which remains uncompressed since it's a single character.

Example 3:
Input: chars = ["a","b","b","b","b","b","b","b","b","b","b","b","b"]
Output: Return 4, and the first 4 characters of the input array should be: ["a","b","1","2"].
Explanation: The groups are "a" and "bbbbbbbbbbbb". This compresses to "ab12".
 

- input: an array of characters
- output: integer

requirements/questions?
- compress consecutive repeating characters to a single character "aaa" -> "a"
- modification/compression should occur in self
- return length of the array

mental model
- a counter (walker) to keep track of current element to replace
- another counter (runner) to track next elements
- runner should iterate until element at runner and element after runner are not equal
  - through this iteration, keep track of count and increment runner
- when iteration stops update current element at walker to reference element at runner
  - increment walker by 1
  - reassign element at walker to reference count if > 1 and increment walker by 1
    - if reference count > 9 then
    - each digit in digits
      - reassign element at walker to digit
      - increment walker by 1
- return walker value

data structure
-

algorithm
- initialize a walker and a runner and set to 0
- while runner is less than length of input array
  - initialize a variable to keep track of character counts and set to 1
  - while element at runner and runner+1 are equal
    - increment character counts by 1
    - increment runner by 1
  - reassign element at walker to element at runner
  - increment walker by 1
  - if character count is greater than 1
    - convert character count to an array of string integers
    - each digit in array
      - reassign element at walker to digit
      - increment walker by 1
  - increment runner by 1
- return walker

=end


def compress(array)
  walker, runner = 0, 0

  while runner <= array.length - 1
    character_count = 1

    while array[runner] == array[runner+1]
      character_count += 1
      runner += 1
    end

    array[walker] = array[runner]
    walker += 1

    if character_count > 1
      character_count = character_count.to_s.chars
      character_count.each do |digit|
        array[walker] = digit
        walker += 1
      end
    end

    runner +=1
  end
  # walker
  array
end

p compress(["a","a","b","b","c","c","c"]) #== ["a","2","b","2","c","3"]
p compress(["a"]) #== ["a"]
p compress(["a","b","b","b","b","b","b","b","b","b","b","b","b"]) #== ["a","b","1","2"]

## time 25 min

