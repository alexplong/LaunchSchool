=begin
Difficulty: ___

Mothers arranged a dance party for the children in school. At that party, 
there are only mothers and their children. All are having great fun on the 
dance floor when suddenly all the lights went out. It's a dark night and no one 
can see each other. But you were flying nearby and you can see in the dark and 
have ability to teleport people anywhere you want.

Legend:

  -Uppercase letters stands for mothers, lowercase stand for their children, i.e. "A" mother's children are "aaaa".
  -Function input: String contains only letters, uppercase letters are unique.

Task:

Place all people in alphabetical order where Mothers are followed by their children, i.e. "aAbaBb" => "AaaBbb".


input: a string
output: a new string

RULES
- Given a string of characters
  - Uppercase chars are mother (are unique) and same letter but lowercase are the children (not unique)
- Return string in alphabetical order with uppercase letter is followed by the lowercase forms
- Empty string input is a possibility

DATA STRUCTURE

ALGORITHM
- Given a string of chars both upper (unique) and lowercase
- Create two variables parents and kids and set to empty array
- Create a result variable and set to empty string
- Iterate through the string
  - Push uppercase chars to parents array
  - Push lowercase chars to kids array
- Iterate through sorted parents array
  - Append parent to result string
  - Get count of lowercase parent in kids array
  - Append lowercase parent to result x count times
- Return result
=end

def find_children(str)
  # # parents, result = [[], ""]
  # result = ""

  # parents, kids = str.chars.partition do |char|
  #                   char.match?(/[A-Z]/)
  #                 end

  # # str.each_char do |char|
  # #   char.match?(/[A-Z]/) ? parents << char : kids << char
  # # end

  # parents.sort.each do |char|
  #   result << char
  #   kids_count = str.count(char.downcase)
  #   result << char.downcase * kids_count
  # end

  # result

  str.chars.sort.sort_by {|char| char.downcase}.join


end
