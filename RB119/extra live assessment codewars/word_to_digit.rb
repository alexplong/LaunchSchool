=begin
Difficulty: medium

Given a string that contains the written versions of the numbers 0-9, return the same string that has converted each writtten number within the string to an integer.

a = 'One Two Three' 
convert_word_to_number(a) == '1 2 3' a == '1 2 3'

b = 'one Two three' 
convert_word_to_number(b) == '1 2 3' b == '1 2 3'
=end



convert_word_to_number('One Two Three and some words') == '1 2 3 and some words' 
convert_word_to_number('Nine eight seven and some words') == '9 8 7 and some words'
convert_word_to_number('one word') == '1 word' 
convert_word_to_number('lone word') == 'lone word'