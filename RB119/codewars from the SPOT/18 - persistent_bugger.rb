=begin
Difficulty: medium

Write a function, persistence, that takes in a positive parameter num and 
returns its multiplicative persistence, which is the number of times you 
must multiply the digits in num until you reach a single digit.

For example:

 persistence(39) # returns 3, because 3*9=27, 2*7=14, 1*4=4
                 # and 4 has only one digit

 persistence(999) # returns 4, because 9*9*9=729, 7*2*9=126,
                  # 1*2*6=12, and finally 1*2=2

 persistence(4) # returns 0, because 4 is already a one-digit number

=end

=begin
input: an integer
output: an integer

RULES
- Given an integer
- Get it's multiplicative persistence
  - 39 => 3 * 9 = 27 => 2 * 7 = 14 => 1 * 4 = 4
- Continue until you reach a single digit

ALGORITHM
- Given an integer
- Create a variable result and set it to 0
- While given integer is greater than 9
  - Split integer into an array of numbers
  - Get the product from these numbers
  - Reassign integer to this new product value
  - Increment persistence by 1
- Return persistence
=end

# def persistence(int)
#   result = 0

#   while int > 9
#     int = int.digits.reduce(:*)
#     result += 1
#   end
#   result
# end 


def persistence(num)
  iterations = 0

  while num > 9
    num = num.digits.reduce(:*)
    iterations += 1
  end

  iterations
end

p persistence(39) == 3
p persistence(4) == 0
p persistence(25) == 2
p persistence(999) == 4
