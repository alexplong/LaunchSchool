=begin
You are going to be given an array of integers. Your job is to take that array
and find an index N where the sum of the integers to the left of N is equal to
the sum of the integers to the right of N. If there is no index that would make
this happen, return -1.
For example:
Let's say you are given the array [1, 2, 3, 4, 3, 2, 1]:
Your method will return the index 3, because at the 3rd position of the array,
the sum of left side of the index [1, 2, 3] and the sum of the right side of the
index [3, 2, 1] both equal 6.
Another one:
You are given the array [20, 10, -80, 10, 10, 15, 35]
At index 0 the left side is []
The right side is [10, -80, 10, 10, 15, 35]
They both are equal to 0 when added. (Empty arrays are equal to 0 in this problem)
Index 0 is the place where the left side and right side are equal.

# Problem
- input: an array of integers
- output: an integer or -1

Requirements/Questions?
- return index position where elements to left == elements to right
- element at current index position not included in sum
- at index 0: left of that element is [] so sum is 0 (empty arrays = 0)
- similar at right edge of array

Mental Model
- Iterate through array and keep track of current index
- Split into two subarrays and dont include current element in either subarray
- Compare sum
  - Return current index if sums are equal
- return -1

# Examples
- 

# Data Structures
- 

# Algorithms
- Given an array of integers
- Each index position in the array
  - If index position is 0 or last
    - compare sum of whole array to 0
  - Otherwise split array into left and right subarrays and compare sums
  - Return current index if sums are equal
- Return -1

# Code with Intent
=end

def find_even_index(arr)
  arr.each_index do |i|
    # if i == 0 || i == arr.length - 1
    #   left = 0
    #   right = arr.sum - arr[i]
    # else
      left = arr[...i].sum
      right = arr[i+1...arr.length].sum
    # end
    return i if left == right
  end
  -1 
end

p find_even_index([1, 2, 3, 4, 3, 2, 1]) == 3
p find_even_index([1, 100, 50, -51, 1, 1]) == 1 
p find_even_index([1, 2, 3, 4, 5, 6]) == -1
p find_even_index([20, 10, 30, 10, 10, 15, 35]) == 3
p find_even_index([20, 10, -80, 10, 10, 15, 35]) == 0
p find_even_index([10, -80, 10, 10, 15, 35, 20]) == 6
p find_even_index([-1, -2, -3, -4, -3, -2, -1]) == 3

## time 21 min