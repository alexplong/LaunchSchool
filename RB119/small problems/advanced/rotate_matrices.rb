=begin

MENTAL MODEL
- Iterate through first subarray and add each [element] to result array
- Next subarray for each element, unshift current element to approriate nested array
- Return rotated matrix

ALGORITHM
- Initialize a result variable and set to empty Array
- Iterate through each subArray in Array with index - m
  - Iterate through each element in subArray with index - n
    - If m is equal to 0, add [ curr element ] to result Array
    - Else unshift curr element to result Array at [n]
- Return result Array
=end

def rotate90(matrix)
  result = []
  
  matrix.each_with_index do |subArray, m|
    subArray.each_with_index do |element, n|
      if m == 0
        result << [ element ]
      else
        result[n].unshift(element)
      end
    end
  end

  result
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2