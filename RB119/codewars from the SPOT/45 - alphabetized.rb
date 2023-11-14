=begin
Difficulty: medium

Re-order the characters of a string, so that they are concatenated into a new 
string in "case-insensitively-alphabetical-order-of-appearance" order. 
Whitespace and punctuation shall simply be removed!

The input is restricted to contain no numerals and only words containing the 
english alphabet letters.

Example:

alphabetized("The Holy Bible") # "BbeehHilloTy"

=end

=begin
Input: a String
Output:

RULES
Explicit:
- Reorder given string
- New string where chars are concatenated in "case-insensitively-alphabetical-order-of-appearance" order
- Only english alphabet in string
- Can remove whitespace and punctuation
- New string concatenated with no spaces in between

Implicit:
- Empty string returns empty string
- Punctuation or whitespace only string returns empty string

EXAMPLE
"Hello There" # iterate through striing
              # each iteration check if curr char downcase has a value
              # if it does, append curr char to Array of corresponding key
              # otherwise add key and Array as value with curr char in array
{ "a" => ["a", "A"]}

MENTAL MODEL
- 

DATA STRUCTURES
- 1 String: input
- 1 String: output
- 1 Hash: curr_char key and array of chars encountered as value

ALGORITHM
- Initialize an output variable and set to empty string
- Initialize a dictionary Hash and set to empty
- Iterate through each char in String
- If curr char is a letter 
  - Next if curr char is not an alphabet
  - check if dictionary has downcased curr char as a key
    - If yes, append curr char to value ARray associated with key
    - Else, set downcase curr char as key and set equal to array containing curr char
- Get Array of keys from dictionary and sort
- Iterate through each key from keys
  - With Aray of values from associated key, join elements with no spaces and append string to output
- Return output
=end

def alphabetized(str)

  output = ""
  dictionary = {}

  str.each_char do |char|
    next unless char.match?(/[A-Za-z]/)

    if dictionary[char.downcase]
      dictionary[char.downcase] << char
    else
      dictionary[char.downcase] = [char]
    end
  end

  our_keys = dictionary.keys.sort
  our_keys.each do |curr_key|
    output << dictionary[curr_key].join
  end

  output
end

p alphabetized("") == ""
p alphabetized(" ") == ""
p alphabetized(" a") == "a"
p alphabetized("a ") == "a"
p alphabetized(" a ") == "a"
p alphabetized("A b B a") == "AabB"
p alphabetized(" a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z") == "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ"
