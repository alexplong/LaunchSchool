=begin
Difficulty: easy

Given a string of words, you need to find the highest scoring word.

Each letter of a word scores points according to its position in 
the alphabet: a = 1, b = 2, c = 3 etc.

You need to return the highest scoring word as a string.

If two words score the same, return the word that appears earliest in the original string.

All letters will be lowercase and all inputs will be valid.

=end

=begin
input: a string
output: a string

RULES
- Given a string
- Return the highest scoring word
  - Score refers to tallying number of points according to chars position in the alphabet
- If two words score the same, return the word that appears earliest in the original string

ALGORITHM
- Given a string
- Create a reference alphabet
- Create a variable highest_scoring_word and set it to an empty string
- Create a vairable highest_score and set it to 0
- Transform string into an array of words
- Iterate through each word
  - Iterate through each char for word for transformation
    - Get index value from reference alphabet array and add 1 for curr char
    - Get sum of the array
  - If sum count is greater than highest score, reassign highest word to current word
    - Reassign highest score to word score
- Return hgihest scoring word
=end

def high(str)
  alpha_ref = ('a'..'z').to_a
  highest_scoring_word = ''
  highest_score = 0

  str.split.each do |word|
    word_score = (word.each_char.map do |char|
                   (alpha_ref.index(char) + 1)
                 end.sum)
    
    if word_score > highest_score
      highest_scoring_word = word
      highest_score = word_score
    end
  end

  highest_scoring_word
end

p high('man i need a taxi up to ubud') #== 'taxi'
p high('what time are we climbing up the volcano') #== 'volcano'
p high('take me to semynak') #== 'semynak'
p high('aaa b') #== 'aaa'
