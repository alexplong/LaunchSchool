=begin
Difficulty: ___

In this Kata, you will be given two integers n and k and your task is to 
remove k-digits from n and return the lowest number possible, without changing
the order of the digits in n. Return the result as a string.

Let's take an example of solve(123056,4). We need to remove 4 digits from 123056 
and return the lowest possible number. The best digits to remove are (1,2,3,6) 
so that the remaining digits are '05'. Therefore, solve(123056,4) = '05'.

Note 

The order of the numbers in n does not change: solve(1284569,2) = '12456', 
because we have removed 8 and 9.

Input: two integers, n and k
Output: a string

RULES
- given n and k, remove k-digits from n (any digit)
- return the lowest number possible without changing order of digits in n
- return result as a string

EXAMPLE
123056, 4 # => remove 1,2,3,6
"123056" iterate to remove a number, make sure that this number is lowest one
"12056", 3
"1056", 2
"056", 1
'05', 0

DATA STRUCTURES
2 Integers: input n and k
1 String: output
1 Array: subintegers to find minimum from

ALGORITHM
- Given two integers n and k
- Transform integer into a an array of string ints

- While k is greater than 0
  - Create a variable subintegers and set to input
  - Iterate through array of string ints
    - Remove digit at index position and store in temp variable
      - transform array to a string
      - if previous step string to int is lower than sub_integers to int
        - reassign sub_integers to previous step string 
    - Reassign the input to the sub_integer value transformed to an array of string ints
  - Decrement k by 1
- Return input joined
=end

# to keep leading 0
# Maintain integer as string
# Split to an array of chars
# map each char to an int for minimum check only
# because we want to return the string

def solve(n, k)
input = n.to_s.chars
counter = 0

while k > 0
  sub_integers = n

  input.each_index do |idx|
    temp_int = input.dup
    temp_int.delete_at(idx)
    temp_int = temp_int.join
    sub_integers = temp_int if temp_int.to_i < sub_integers.to_i
  end

  input = sub_integers.chars
  k -= 1

end

input.join
end

# p solve(123056,1) =='12056' #3 
# p solve(123056,2) =='1056'  #2,3 
# p solve(123056,3) =='056'   #1,2,3
p solve(123056,4) =='05'    #1,2,3,6
p solve(1284569,1) =='124569'
p solve(1284569,2) =='12456'
p solve(1284569,3) =='1245'
p solve(1284569,4) =='124'