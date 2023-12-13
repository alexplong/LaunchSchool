=begin
Difficulty: hard

The goal of this exercise is to convert a string to a new string where each 
character in the new string is "(" if that character appears only once in the 
original string, or ")" if that character appears more than once in the original 
string. Ignore capitalization when determining if a character is a duplicate.

Examples

  "din"      =>  "((("
  "recede"   =>  "()()()"
  "Success"  =>  ")())())"
  "(( @"     =>  "))((" 

input: a string
output: a new string

RULES
- Given a string of letters
- Transform characters that count only once in string to '('
- Transform characters that count more than once in string to ')'
  - White-space, special-chars (such as '(', ')', '@' ) also count as chars to transform
  - Ignore capitalization

DATA STRUCTURE

ALGORITHM
- Given a string
- Transform string into an array of chars
- Iterate through array of downcased chars
  - Get count of curr char from downcase input string
  - If count is greater than 1
    - Return ')'
  - Else
    - Return '('
- Join the array back to a string and return it

=end

def duplicate_encode(str)
  str.downcase.chars.map do |char|
    char_count = str.downcase.count(char)
    char_count > 1 ? ')' : '('
  end.join
end

p duplicate_encode("din") == "((("
p duplicate_encode("recede") == "()()()"
p duplicate_encode("Success") == ")())())"
p duplicate_encode("(( @") == "))(("
