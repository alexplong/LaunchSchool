=begin
Difficulty: medium

Given a string, return a new string that has transformed based on the input:

Change case of every character, ie. lower case to upper case, upper case to lower case.
Reverse the order of words from the input.

Note: You will have to handle multiple spaces, and leading/trailing spaces.

For example:

"Example Input" ==> "iNPUT eXAMPLE"
You may assume the input only contain English alphabet and spaces.

"    A b  C   " => reverse the whole string
"   c  B a    " => get reference arr of words ['c', 'B', 'a']
                => iterate through arr and find curr word in reversed input
                => replace found word with curr word transformed to reversed case swap
=end


=begin
ALGORITHM
- Given a string
- Reverse the input string to get proper whitespace reversal
- Get all words from string (words will be in reverse) and store in array for reference
- Iterate through array of words with index
  - In the input string, find the word referenced by element at curr index 
  - Destructively replace that word with word referenced by element at negative curr index with swapcase and reverse transformation
- Return the string
=end

def string_transformer(str)
  str = str.dup
  str.reverse!
  words = str.split


  words.each_index do |idx|

    str.sub!(words[idx], words[idx].swapcase.reverse)
  end

  str
end

p string_transformer('Example string') #== 'STRING eXAMPLE'
p string_transformer("    A b  C   ")# == "   c  B a    "