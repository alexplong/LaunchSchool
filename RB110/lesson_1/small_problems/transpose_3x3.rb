def transpose(matrix)
  matrix.map.with_index do |_, x|
    _.map.with_index do |_, y|
      matrix[y][x]
    end
  end
end

def transpose!(matrix)
  counter = 0
  matrix.each_index do |x|
    y = counter + 1
    loop do
      break if y >= matrix[x].length
      matrix[x][y], matrix[y][x] = matrix[y][x], matrix[x][y]
      y += 1
    end
    counter += 1
  end
  matrix
end




matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]
# new_matrix = transpose(matrix)

# p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
# p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

new_matrix = transpose!(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]