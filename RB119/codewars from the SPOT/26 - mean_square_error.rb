=begin
Difficulty: medium

Complete the function that accepts two integer arrays of equal length and
compares the value each member in one array to the corresponding member in 
the other

Then squares the absolute value difference between those two values and 
returns the average of those squared absolute value difference between each 
member pair.

Examples
[1, 2, 3], [4, 5, 6]              -->   9   because (9 + 9 + 9) / 3
[10, 20, 10, 2], [10, 25, 5, -2]  -->  16.5 because (0 + 25 + 25 + 16) / 4
[-1, 0], [0, -1]                  -->   1   because (1 + 1) / 2

input: a pair of array of integers
output: an integer (or float)

RULES
- Given of pair of array of integers that are equal in length
- Get the absolute value of the difference for each integer pair (same index in the arrays) and then square it
- Get the average of those values and then return it
  - Check for floats!

ALGORITHM
- Given a pair of array of integers
- Create a variable sum and set it to 0
- Create a variable counter and set it to 0
- Start a loop and break out of loop when counter is equal to the size of the input array
  - Subtract element at current index from array1 from element at current index from array2
  - Get absolute value of that value
  - Square it and increment sum by this value
  - Increment counter by 1
- Transform sum to a float and divide it by the length of the array
- Return that average value

=end

def solution(arr1, arr2)
  # sum, counter = [0, 0]

  # while counter < arr1.size
  #   sum += (arr1[counter] - arr2[counter]).abs ** 2
  #   counter += 1
  # end

  # sum % arr1.size != 0 ? sum.to_f / arr1.size : sum / arr1.size

  # sum.to_f / arr1.size
  arr1.map.with_index do |num, idx|
    (num - arr2[idx]).abs ** 2
  end.sum.to_f / arr1.size
end

p solution([1, 2, 3], [4, 5, 6]) == 9
p solution([10, 20, 10, 2], [10, 25, 5, -2]) == 16.5
p solution([-1, 0], [0, -1]) == 1
