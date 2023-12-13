=begin
Difficulty: medium

Given a string of integers, return the number of odd-numbered substrings that 
can be formed.

For example, in the case of "1341", they are 1, 1, 3, 13, 41, 341, 1341, a total of 7 numbers.

=end

=begin
input: a string integer
output: an integer

RULES
- Given a string of integers
- Return the number of odd-numbered integers that can be formed from substrings

ALGORITHM - nested iteration to get all substrings
- Given a string integer
- Create a result variable and set it to 0
- Iterate from 0 to length of string exclusively - outer idx
  - Iterate from outer idx to length of string exclusively - inner idx
    - Get substring from range outer idx to inner idx inclusively
    - Transform substring to integer and check if odd
    - Increment result by 1 if true
- Return result
=end

def solve(str)
  result = 0

  (0...str.size).each do |outer_idx|
    (outer_idx...str.size).each do |inner_idx|
      result += 1 if str[outer_idx..inner_idx].to_i.odd?
    end
  end

  result
end

p solve("1341") == 7
p solve("1357") == 10
p solve("13471") == 12
p solve("134721") == 13
p solve("1347231") == 20
p solve("13472315") == 28

# Nested iteration to count