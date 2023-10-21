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
# - Create a constant third_word and set to ___
# - Iterate to create copy and return transformed string
#   - For each word in words - check if word is the 3rd word
#     - If true, return word thats been split and rejoined where every second character in word transformed to uppercase
#     - else just return word
# - Return transformed string
#
## Code with Intent

THIRD_WORD = 3

def to_weird_case(str)
  weird = str.split
  weird.map!.with_index  do |word, idx|
    if (idx + 1) % THIRD_WORD == 0

      weird_word = word.chars
      weird_word.map!.with_index do |char, idx2|
        if idx2.odd?
          char.upcase
        else
          char
        end
      end
      weird_word.join
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