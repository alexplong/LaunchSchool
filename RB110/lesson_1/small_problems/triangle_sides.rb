def triangle(x, y, z)
  sorted = [x, y, z].sort
  return :equilateral if x == y && y == z
  return :invalid if x <= 0 || y <= 0 || z <= 0 || sorted[0] + sorted[1] < sorted[2]
  return :isosceles if x == y || y == z || x == z
  :scalene
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid