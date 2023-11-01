=begin
Difficulty: medium

Re-order the characters of a string, so that they are concatenated into a 
new string in "case-insensitively-alphabetical-order-of-appearance".

Whitespace and punctuation shall simply be removed.
The input string can contain any characters except for numbers.

=end 


p alphabetized("The Holy Bible") == "BbeehHilloTy" 
p alphabetized("!@$%^&*()_+=-`,") == "" 
p alphabetized("codeWars Can't Load Today") == "aaaacCdddeLnooorstTWy"
