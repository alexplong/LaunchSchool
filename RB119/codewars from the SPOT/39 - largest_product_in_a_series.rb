=begin
Difficulty: hard

Complete the greatestProduct method so that it'll find the greatest product of 
five consecutive digits in the given string of digits.

For example:

greatestProduct("123834539327238239583") // should return 3240
The input string always has more than five digits.

=end

=begin
input: a string of integers
output: integers

RULES
- Given a string of numbers
- Return the largest product given a sliding window of 5 digits

ALGORITHM
- Given a string of integers
- Iterate through the string and select 5 consecutive digits stating from curr index
  - Transform the string of numbers into an array of digits and get the product
  - Return the max value produced
=end

def greatest_product(str)
  products = []

  (0..str.size).each do |i|
    substr = str.slice(i, 5)
    break if substr.size < 5

    products << substr.chars.map(&:to_i).reduce(:*)
  end

  products.max
end

p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") #== 5292
p greatest_product("92494737828244222221111111532909999") #== 5292
p greatest_product("02494037820244202221011110532909999") #== 0
