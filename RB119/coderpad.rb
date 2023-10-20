def transpose(arrs)
	new_arrs = arrs.map {|arr| arr.map {nil}}

	arrs.each_with_index do |sub_arr, x|

		sub_arr.each_with_index do |_, y|
			new_arrs[x][y], new_arrs[y][x] = arrs[y][x], arrs[x][y] if (new_arrs[x][y] == nil && new_arrs[y][x] == nil)

      # new_arrs[y][x] = arrs[x][y] if new_arrs[y][x] == nil
      # new_arrs[x][y] = arrs[y][x] if new_arrs[x][y] == nil
		end

	end
	
new_arrs

end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
