require 'pry'
=begin

Transpose MxN

In the previous exercise, you wrote a method to transpose a 3 x 3 matrix as represented by a ruby Array of Arrays.
Matrix transposes aren't limited to 3 x 3 matrices, or even square matrices. Any matrix can be transposed by simply switching columns with rows.
Modify your transpose method from the previous exercise so it works with any matrix with at least 1 row and 1 column.
=end

=begin
input: a matrix m x n
output: a matrix n x m

RULES
Explicit:
- Elements in matrix m x n where m is row and n is column
- At least 1 row and 1 column minimum transpose

Implicit:
- Elements are Integers
- Pass by value first, then write ! variant

EXAMPLE

matrix = [
  [1, 2, 3, 4, 5],
  [4, 3, 2, 1, 0],
  [3, 7, 8, 6, 2]
]

transposed = [
  [1, 4, 3],
  [2, 3, 7],
  [3, 2, 8],
  [4, 1, 6],
  [5, 0, 2],
]

     n  n  n  n
m  [[1, 2, 3, 4]]

   m
[ [1],  n
  [2],  n
  [3],  n
  [4] ] n


DATA STRUCTURE - Pass by value
- 1 nested Array: input
- 1 nested Array: output
- 

MENTAL MODEL 
- Take nested Array and with first subArray wrap each element in an array
  - This first iteration gives us all the rows we need
  - After first iteration, push each element to appropriate row
- Return new Array

ALGORITHM
- Given a nested Array as input
- Initialize a result variable and set to empty Array
- Iterate through Array input with index - m
  - Iterate through subArray with index - n
    - If m is equal to 0, append [ subArray[n] ] to result Array 
    - Else append subArray[n] to result Array [n]
- Return result Array
=end

def transpose(arr)

  result = []

  arr.each_with_index do |subArr, m|
    subArr.each_with_index do |element, n|
      if m == 0
        result << [ element ]
      else
        result[n] << element
      end
    end
  end
  
  result

end


p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
    [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]