=begin
Difficulty: medium

Modify the kebabize function so that it converts a camel case string into a 
kebab case.

kebabize('camelsHaveThreeHumps') // camels-have-three-humps
kebabize('camelsHave3Humps') // camels-have-humps

Notes:
the returned string should only contain lowercase letters

input: a camel case string
output: a kebab case string

RULES
- Given a string that is in camel case format
- Transform it into a kebab case and return it
  - Returned string must be lowercase letters ONLY
  - '-' inserts where there is lowercase and uppercase boundary

ALGORITHM
- Given a string
- Create a result variable and set it to an empty string
- Iterate through each character from the given string
  - If curr char is lowercase
    - Append curr char to result string
  - Else If curr char is uppercase
    - Append a hyphen and the downcased curr char to result string
  - Else
    - Next
- Return result string

=end

# def kebabize(str)
#   result = ""

#   str.each_char do |char|
#     if char.match?(/[a-z]/)
#       result << char
#     elsif char.match?(/[A-Z]/)
#       result << ('-' + char.downcase)
#     end
#   end

#   result
# end


def kebabize(str)
  str.chars.map do |char|
    char.match?(/[A-Z]/) ? "-#{char.downcase}" : char.match?(/[0-9]/) ? '' : char
  end.join
end

p kebabize('myCamelCasedString') == 'my-camel-cased-string'
p kebabize('myCamelHas3Humps') == 'my-camel-has-humps'
