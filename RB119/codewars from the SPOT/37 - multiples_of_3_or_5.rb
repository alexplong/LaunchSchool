=begin
Difficulty: easy

If we list all the natural numbers below 10 that are multiples of 3 or 5, 
we get 3, 5, 6 and 9. The sum of these multiples is 23.

Finish the solution so that it returns the sum of all the multiples of 3 
or 5 below the number passed in.

Note: If the number is a multiple of both 3 and 5, only count it once.

=end

=begin
input: an integer
output: an integer

RULES
- Given an integer
- Get numbers below given number that are multiples of 3 or 5
  - Get sum of those values
- Return that value

ALGORITHM
- Given an integer
- Get a range of values from 1 to given number
  - Keep numbers that are divisible by 3 or 5 in a collection
- Find the sum of those numbers and return it
=end

def solution(int)
  (1...int).each_with_object([]) do |n, collection|
    collection << n if (n % 3 == 0) || (n % 5 == 0)
  end.sum

end

p solution(10) == 23
p solution(20) == 78
p solution(200) == 9168

