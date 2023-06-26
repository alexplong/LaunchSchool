# clearly explain, talk about, or demonstrate the following topics

# numbers: integers and floats
# strings
# interpolation in strings
# boolean vs. truthiness
# nil
# array and hash syntax
# array properties and methods: Array#size, Array#push, Array#pop
# operators
# numeric operators: +, -, *, /, %, divmod, **
# string operators: +, *
# conditional operators: ==, !=, <, >, <=, >=, ternary
# logical operators and short-circuit evaluation: !, &&, ||
# operator precedence


################################################################
# literals
"Hello"       # string literal
824           # integer literal
3.14          # float literal
true          # boolean literal
[1, 2, 3]     # array literal
{a: 1, b: 2}  # hash literal
:sym          # symbol literal
nil           # nil literal


# strings
single_quotes = 'often work with data like names, messages, etc'
double_quotes = "can be represented with single or double quotes"
single_quote_w_backslashes = 'we can use \'backslashes\' to escape for single quotes to insert within one'

set_of_numbers = [1, 2, 3]

puts interpolated_string = "double quotes allow for string interpolation-- we interpolate these numbers: #{set_of_numbers.join(", ")}"
