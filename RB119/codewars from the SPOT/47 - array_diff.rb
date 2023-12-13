=begin
Difficulty: ___

Your goal in this kata is to implement a difference function, which subtracts 
one list from another and returns the result.

It should remove all values from list a, which are present in list b.

array_diff([1,2],[1]) == [2]
If a value is present in b, all of its occurrences must be removed from the other:

=end

=begin
input: a pair of array of integers
output: an array of integers

RULES
- Given arr1 and arr2
- Remove elements that are in arr2 from arr1
- Return the new array 

ALGORITHM
- 
=end

def array_diff(arr1, arr2)
  arr1 - arr2

end


p array_diff([1,2], [1]) == [2]
p array_diff([1,2,2], [1]) == [2,2]
p array_diff([1,2,2], [2]) == [1]
p array_diff([1,2,2], []) == [1,2,2]
p array_diff([], [1,2]) == []
