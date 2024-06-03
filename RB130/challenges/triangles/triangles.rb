=begin
Write a program to determine whether a triangle is equilateral, isosceles, or scalene.
An equilateral triangle has all three sides the same length.
An isosceles triangle has exactly two sides of the same length.
A scalene triangle has all sides of different lengths.
Note: For a shape to be a triangle at all, all sides must be of length > 0, and the sum of the lengths of any two sides must be greater than the length of the third side.
=end

class Triangle
  attr_reader :sides 

  def initialize(a, b, c)
    @sides = [a, b, c]
    raise ArgumentError if invalid?
  end

  def kind
    unique_sides = sides.uniq.size
    case unique_sides
    when 3 then "scalene"
    when 2 then "isosceles"
    when 1 then "equilateral"
    end
  end

  private

  def invalid?
    sides.any? { |side| side.zero? || side.negative? } || invalid_sides?(*sides)
  end

  def valid_sides?(a, b, c)
    a + b > c && b + c > a && a + c > b
  end

  def invalid_sides?(a, b, c)
    !valid_sides?(a, b, c)
  end
end