=begin
Difficulty: medium

Create a method called "power" that takes two integers and returns the value of 
the first argument raised to the power of the second. Return nil if the second 
argument is negative.

Note: The ** operator has been disabled.

=end

=begin
Input: two integers
Output: an integer

RULES
Explicit:
- Given two integers
- Return an integer where first argument is raised to the power of the second
- Return nil if 2nd arg is negative
- Cannot use ** operator

Implicit
-

EXAMPLES
2 power 3 => 2 * 2 * 2 = 8 == 2 ** 3

DATA STRUCTURES
- 2 Integers: inputs
- 1 Integer: output

ALGORITHM
- Given two integers 1st and 2nd
- If 2nd argument is less than 0 return nil
- Initialize a variable result and set to 1
- Iterate a block 2nd argument number of times
  - Increment result by multiplying with 1st argument value
- Return result

=end

def power(num, pow)
  return nil if pow < 0
  result = 1

  pow.times { |_| result *= num}
  result
end

p power(2, 3) == 8
p power(10, 0) == 1
p power(-5, 3) == -125
p power(-4, 2) == 16
p power(10, 0) == 1
p power(2, 3) == 8
p power(3, 2) == 9
p power(-5, 3) == -125
p power(-4, 2) == 16
p power(8, -2) == nil
