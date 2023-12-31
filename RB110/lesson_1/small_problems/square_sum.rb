def sum_square_difference(n)
  square_sum, sum_squares = [(1..n).to_a, (1..n).to_a]
  ((square_sum.sum) ** 2) - (sum_squares.map {|n| n**2}).sum
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150