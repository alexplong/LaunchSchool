=begin
Difficulty: medium

Given a List [] of n integers , find the minimum number to be inserted in a list, so 
that the sum of all elements of the list should equal the closest prime number .

Notes

  List size is at least 2 .

  List's numbers will only have positives (n > 0) .

  Repetition of numbers in the list could occur .

  The newer list's sum should equal the closest prime number .

Input >> Output Examples

1- minimumNumber ({3,1,2}) ==> return (1)
Explanation:
Since , the sum of the list's elements equal to (6) , the minimum number to be inserted 
to transform the sum to prime number is (1) , which will make *the sum of the List** 
equal the closest prime number (7)* .

2-  minimumNumber ({2,12,8,4,6}) ==> return (5)
Explanation:
Since , the sum of the list's elements equal to (32) , the minimum number to be inserted 
to transform the sum to prime number is (5) , which will make *the sum of the List** equal 
the closest prime number (37)* .

3- minimumNumber ({50,39,49,6,17,28}) ==> return (2)
Explanation:
Since , the sum of the list's elements equal to (189) , the minimum number to be inserted 
to transform the sum to prime number is (2) , which will make *the sum of the List** equal 
the closest prime number (191)* .

=end

=begin
input: an array of integers
output: an integer

RULES
- Given an array of numbers
- Find the number that needs to be inserted into the array to return a sum that is a prime
- If the array of numbers is already a prime when sum, return 0

ALGORITHM
- Given an array of numbers
- Get the sum from the array
- Iterate from sum up to the next number
  - Check if number is a prime number
    - Primes are only divisible by itself and 1
- Subtract sum of array from the prime number
- Return that number
=end

def is_prime?(num)
  (2...num).all? { |i| num % i != 0 }
end

def minimum_number(arr)
  (arr.sum...).each do |n|
    break n - arr.sum if is_prime?(n)
  end
end

p minimum_number([3,1,2]) == 1
p minimum_number([5,2]) == 0
p minimum_number([1,1,1]) == 0
p minimum_number([2,12,8,4,6]) == 5
p minimum_number([50,39,49,6,17,28]) == 2
