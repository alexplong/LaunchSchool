=begin
Difficulty: ___

Write a function triple_double(num1, num2) which takes numbers num1 and num2 and 
returns 1 if there is a straight triple of a number at any place in num1 and also 
a straight double of the same number in num2.

If this isn't the case, return 0

Examples

triple_double(451999277, 41177722899) == 1
# num1 has straight triple 999s and  num2 has straight double 99s

triple_double(1222345, 12345) == 0
# num1 has straight triple 2s but num2 has only a single 2

input: a pair of integers num1 and num2
output: an integer 0 or 1

RULES
- given a pair of numbers num1 and num2
- return 1 if num1 contains straight continuous triple of a number at any place
  - and if the same number is also a straight continuous double in num2
- return 0 if not the case


DATA STRUCTURE

ALGORITHM
- Given a pair of integers num1 and num2
- Transform each integer into a string
- Transform string1 into an array and get the unique numbers
- Iterate through unique numbers of string1
  - If num1 contains a triplet of curr number and num2 contains a double of curr number
  - Return 1
- 0

=end

def triple_double(num1, num2)
  num1 = num1.to_s
  num2 = num2.to_s

  num1.chars.uniq.each do |num|
    return 1 if num1.match?(/#{num}{3,}/) && num2.match?(/#{num}{2,}/)
  end

  0
end

p triple_double(12345, 12345) == 0
p triple_double(666789, 12345667) == 1
p triple_double(66789, 12345667) == 0

p triple_double(451999277, 41177722899) == 1
p triple_double(1222345, 12345) == 0
p triple_double(12345, 12345) == 0
p triple_double(666789, 12345667) == 1
p triple_double(10560002, 100) == 1
p triple_double(1112, 122) == 0
