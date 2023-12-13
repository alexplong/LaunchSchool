=begin
Difficulty: medium

Write a function that takes in a string of one or more words, and returns the 
same string, but with all five or more letter words reversed (Just like the 
name of this Kata). Strings passed in will consist of only letters and spaces. 
Spaces will be included only when more than one word is present.

Example: 
spinWords( "Hey fellow warriors" ) => returns "Hey wollef sroirraw"

input: a string
output: a string

RULES
- Given a string
- Return a new string with words 5 or greater in length reversed

ALGORITHM
- Given a string
- Split string into an array of words
- Iterate through array of words for transformation
  - Get length of curr word
  - If length of curr word is  5 or greater, reverse the word
  - Otherwise keep word as is
- Join the array of words back to a string separated by spaces
- Return this string
=end

def spinWords(str)
  str.split.map do |word|
    if word.size >= 5
      word.reverse
    else
      word
    end
  end.join(' ')
end

p spinWords("Hey fellow warriors") == "Hey wollef sroirraw"
p spinWords("This is a test") == "This is a test" 
p spinWords("This is another test") == "This is rehtona test"
p spinWords('test') == 'test'
