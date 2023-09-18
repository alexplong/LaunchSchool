def triangle(x, y, z)
  return :invalid if x + y + z != 180 || (x <= 0 || y <= 0 || z <= 0) 
  return :acute if x < 90 && y < 90 && z < 90
  return :right if x == 90 || y == 90 || z == 90
  return :obtuse if x > 90 || y > 90 || z > 90
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid