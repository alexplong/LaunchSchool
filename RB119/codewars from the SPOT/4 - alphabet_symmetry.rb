=begin
Difficulty: medium

Consider the word "abode". We can see that the letter a is in position 1 and b
is in position 2. In the alphabet, a and b are also in positions 1 and 2. Notice
also that d and e in abode occupy the positions they would occupy in the alphabet,
which are positions 4 and 5.

Given an array of words, return an array of the number of letters that occupy 
their positions in the alphabet for each word. 

Input will consist of alphabet characters, both uppercase and lowercase. No spaces.

Examples

solve(["abode","ABc","xyzD"]) = [4, 3, 1]

input: an array of strings
output: an array of integers

RULES
- Given an array of strings
- Get the number of chars for each string that occupy the similar positions in the alphabet
- Return an array of that count
  - Chars are both uppercase and lowercase with no spaces

ALGORITHM
- Given an array of strings
- Create a reference alphabet from a-z in an array
- Iterate through each word in the array for transformation
  - Iterate through each char of DOWNCASED word with index to COUNT index position
    - Check if curr index is equal to index of curr char in alphabet reference array
- Return the transformed array that consists of integers representing the count
=end

def solve(arr)
  alpha_ref = ('a'..'z').to_a

  arr.map do |word|
    word.downcase.chars.each_with_index.count do |char, idx, char2|
      idx == alpha_ref.index(char)
    end
  end
  
end

p solve(["abode","ABc","xyzD"]) #== [4,3,1]
p solve(["abide","ABc","xyz"]) #== [4,3,0]
p solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"])#== [6,5,7]
p solve(["encode","abc","xyzD","ABmD"]) #== [1, 3, 1, 3]
