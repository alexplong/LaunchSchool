=begin
Difficulty: ___

You are given an array (which will have a length of at least 3, but could be very large) 
containing integers. The array is either entirely comprised of odd integers or entirely 
comprised of even integers except for a single integer N. Write a method that takes the 
array as an argument and returns this "outlier" N.

Examples

[2, 4, 0, 100, 4, 11, 2602, 36]
Should return: 11 (the only odd number)

[160, 3, 1719, 19, 11, 13, -21]
Should return: 160 (the only even number)

Input: an array (at least 3 elements) of integers (can be large set)
Output: an integer

RULES
- The array is either entirely comprised of odd integers or entirely comprised of even integers except for a single integer N
- Return the "outlier" which is N

ALGORITHM
- Create two varaibles odd_collection and even_collection and set each to empty array
- Given an array of integers
- Iterate through each integer in given array
  - Push curr integer to odd_collection array if curr integer is odd
  - Push curr integer to even_collection if curr integer is even
- If size of odd_collection array is 1 return the first element in this collection
- Else return the first element in the even_collection
=end

def find_outlier(arr)
  # odd_collection, even_collection = [[], []]

  # arr.each do |num|
  #   odd_collection << num if num.odd?
  #   even_collection << num if num.even?
  # end

  
  odd_collection, even_collection = arr.partition do |num|
    num.odd?
  end
  
  odd_collection.size == 1 ? odd_collection.first : even_collection.first
end

p find_outlier([0, 1, 2]) == 1
p find_outlier([1, 2, 3]) == 2