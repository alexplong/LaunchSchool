=begin
Difficulty: easy

You've just discovered a square (NxN) field and you notice a warning sign. The 
sign states that there's a single bomb in the 2D grid-like field in front of you.

Write a function mineLocation/MineLocation that accepts a 2D array, and returns 
the location of the mine. The mine is represented as the integer 1 in the 2D 
array. Areas in the 2D array that are not the mine will be represented as 0s.

The location returned should be an array where the first element is the row 
index, and the second element is the column index of the bomb location (both 
should be 0 based). All 2D arrays passed into your function will be square (NxN), 
and there will only be one mine in the array.


input: a nested array
output: a 2-element array

RULES
- Given square 2D grid - nested arrays
- Find the location of the mine (designated by the 1) in the arrays
- There will only be 1 mine

ALGORITHM
- Given a 2D array of size NxN
- Iterate through the arrays with index (outer_idx)
  - If the subarray has a 1 included in it
    - Determine the index of the 1 in the sub array (inner_idx)
    - Return a 2-element array as such [outer_idx, inner_idx]
=end

def mineLocation(arr)
  arr.each_with_index do |subarr, outer_idx|
    return [outer_idx, subarr.index(1)] if subarr.include?(1)
  end
end

p mineLocation( [ [1, 0, 0], [0, 0, 0], [0, 0, 0] ] ) == [0, 0]
p mineLocation( [ [0, 0, 0], [0, 1, 0], [0, 0, 0] ] ) == [1, 1]
p mineLocation( [ [0, 0, 0], [0, 0, 0], [0, 1, 0] ] ) == [2, 1]
p mineLocation([ [1, 0], [0, 0] ]) == [0, 0]
p mineLocation([ [1, 0, 0], [0, 0, 0], [0, 0, 0] ]) == [0, 0]
p mineLocation([ [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 1, 0], [0, 0, 0, 0] ]) == [2, 2]
