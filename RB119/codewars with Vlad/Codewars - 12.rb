
require "prime"
=begin
Given a List [] of n integers , find minimum number to be inserted in a list, so that sum of all elements of list should equal the closest prime number .
Notes

    List size is at least 2 .
    List's numbers will only positives (n > 0) .
    Repetition of numbers in the list could occur .
    The newer list's sum should equal the closest prime number .

Input >> Output Examples

1- minimumNumber ({3,1,2}) ==> return (1)
Explanation:

    Since , the sum of the list's elements equal to (6) , the minimum number to be inserted to transform the sum to prime number is (1) , which will make the sum of the List equal the closest prime number (7) .

2-  minimumNumber ({2,12,8,4,6}) ==> return (5)
Explanation:

    Since , the sum of the list's elements equal to (32) , the minimum number to be inserted to transform the sum to prime number is (5) , which will make the sum of the List equal the closest prime number (37) .

3- minimumNumber ({50,39,49,6,17,28}) ==> return (2)
Explanation:

    Since , the sum of the list's elements equal to (189) , the minimum number to be inserted to transform the sum to prime number is (2) , which will make the sum of the List equal the closest prime number (191) .

Input: an array of intgers
Output: an integer

RULES
Explicit:
- Given a list of at least 2
- Prime Number? number divisible only by 1 and itself 1, 3, 5, 7, 13, 17
- Find min number to be added to list so sum of all elements == closest prime number
- Integers will only be positive
- Repitition of number in list can occur
- Pass by value 

Implicit:
- What if the Array already sums up to a prime number? Then return 0

MENTAL MODEL
- First determine the sum of the array
- Next determine the upcoming prime number after the current sum
- Find the difference between upcoming prime and current sum
- Return the difference

ALGORITHM
- Given a set of numbers in an array
- Determine the sum of those numbers
- Return 0 if sum is_prime?
- Find the next prime number after current sum using find_next_prime
- Find difference by subtracting next prime number from current sum
- Return the difference

find_next_prime helper method
  - Given a sum value as input
  - Create a counter and set to value sum + 1
  - Start a loop
    - Check if counter is_prime?
    - If true, break counter
    - Else increment counter by 1

is_prime? method
- Given a sum
- Create an array from (2...sum)
- Check if all elements in array where sum modulo element is not equal to 0
- Return true if all elements return true
- Else return false

=end

def minimum_number(arr)
  sum = arr.sum
  return 0 if is_prime?(sum)

  next_prime = find_next_prime(sum)
  next_prime - sum
end

def find_next_prime(sum)
  counter = sum + 1
  
  loop do
    if is_prime?(counter)
      return counter
    else
      counter += 1
    end
  end
end

def is_prime?(sum)

  counter = 3
  loop do
    return false if sum % counter == 0 && counter != sum
    counter += 2
    break if counter >= sum - 1
  end
  true
  
  # (2...sum).to_a.all? do |n|
  #   sum % n != 0
  # end
end


p minimum_number([3,1,2]) == 1
p minimum_number([5,2]) == 0
p minimum_number([1,1,1]) == 0
p minimum_number([2,12,8,4,6]) == 5
p minimum_number([50,39,49,6,17,28]) == 2

p find_next_prime(6)

p is_prime?(3)
p is_prime?(4)
p is_prime?(7)



## 25 + 12
## if using helper method > at least call and invoke the helper method to check
## AGAIN, AT LEAST with helper methods!
