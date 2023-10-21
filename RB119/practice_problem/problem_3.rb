# Write a method named to_weird_case that accepts a string, and
# returns the same sequence of characters with every 2nd character
# in every third word converted to uppercase. Other characters
# should remain the same.



## Problem
# input: a string
# output: a string
#
# explicit/implicit requirements:
# - the 2nd character in every 3rd word > convert to uppercase
# - order of characters remains the same - only case change for that particular word
#
# clarifying questions?
# - Pass by value?
#
## Examples:
# The tests should print "true".
#
## Data Structures
# - String: input
# - String: output - copy of original
# - Integer: references 3rd word
# - Array: word to split
#
## Algorithm
# - Given a string as input `str`
# - Create a constant third_word and set to 3 
# - Split input string to an array of words
# - Iterate through array of words to transform every 3rd word 
#   - each word in words - check if word is the 3rd word
#     - If true, pass in word and return the weird_word
#     - else just return word
# - Create a string of concatenated array elements, joined together with a space: ' ' between each element 
# - Return transformed string
#
# weird_word helper method
# - given a string
# - split string into an array of characters
# - each character in string
#   - transform character to upcase if index position is odd (-> refers to 2nd character of the word)
# - method should return string of concatenated array elements, joined together with no spaces in between.
## Code with Intent

THIRD_WORD = 3

def weird_word(string)
  word = string.chars
  word.map!.with_index do |char, idx2|
    if idx2.odd?
      char.upcase
    else
      char
    end
  end
  word.join
end

def to_weird_case(str)
  weird = str.split
  weird.map!.with_index  do |word, idx|
    if (idx + 1) % THIRD_WORD == 0
      weird_word(word)
    else
      word
    end
  end
  weird.join(' ')
end

p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
                'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case(
  'It is a long established fact that a reader will be distracted') ==
  'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case(
  'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
  'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

## time 30+