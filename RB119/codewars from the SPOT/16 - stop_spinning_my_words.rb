=begin
Difficulty: medium

Write a function that takes in a string of one or more words, and returns the 
same string, but with all five or more letter words reversed (Just like the 
name of this Kata). Strings passed in will consist of only letters and spaces. 
Spaces will be included only when more than one word is present.

Example: 
spinWords( "Hey fellow warriors" ) => returns "Hey wollef sroirraw"

=end

p spinWords("Hey fellow warriors") == "Hey wollef sroirraw"
p spinWords("This is a test") == "This is a test" 
p spinWords("This is another test") == "This is rehtona test"
p spinWords('test') == 'test'
