=begin
Difficulty: hard

In this simple Kata your task is to create a function that turns a string into a 
Mexican Wave. You will be passed a string and you must return that string in an 
array where an uppercase letter is a person standing up.

Rules
 	1.  The input string will always be lower case but maybe empty.
  2.  If the character in the string is whitespace then pass over it as if it was an empty seat.

=end


=begin
input: a string
output: an array

RULES
- Given a string
- Return an array of strings from given string
 - Where each element has a new character uppercased until all characters have been uppercased
- Input will always be lower case but maybe empty
- Treat whitespace as an empty seat

ALGORITHM
- Given a string
- Create an empty array to store all the words
- Iterate through the length of the input string
  - Get the given word where at the current index, that character is uppercased
  - Append this word to the result array
- Return the array of words
=end

def wave(str)
  word_wave = []

  (0...str.size).each do |idx|
    word = str.dup
    word[idx] = word[idx].upcase

    word_wave.push(word) unless str == word
  end

  word_wave
end

p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
p wave("") == []
p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
p wave(" gap ") == [" Gap ", " gAp ", " gaP "]
