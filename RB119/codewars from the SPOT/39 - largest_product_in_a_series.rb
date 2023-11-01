=begin
Difficulty: hard

Complete the greatestProduct method so that it'll find the greatest product of 
five consecutive digits in the given string of digits.

For example:

greatestProduct("123834539327238239583") // should return 3240
The input string always has more than five digits.

=end
p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0
