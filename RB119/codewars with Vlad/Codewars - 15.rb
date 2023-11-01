=begin
There is an array with some numbers. All numbers are equal except for one. Try to find it!

find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55

It’s guaranteed that array contains at least 3 numbers.
The tests contain some very huge arrays, so think about performance.
=end

=begin
input: an array
output: a number

RULES
Explicit:
- All numbers in array are equal except for one
- Array contains at least 3 numbers
- Think about performance

Implicit:
- Numbers can be both Integer and Float

DATA STRUCTURES

ALGORITHM
- Given an array of Integers
- Iterate through unique array of integers
  - Count current element in input array
  - Return the element if count is equal to 1
=end

def find_uniq(arr)
  arr.uniq.each do |n|
    return n if arr.count(n) == 1
  end
end

p find_uniq([1,1,1,1,0]) == 0
p find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
p find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55
 