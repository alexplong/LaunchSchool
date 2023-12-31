=begin
Difficulty: medium
Divisors of 42 are : 1, 2, 3, 6, 7, 14, 21, 42. These divisors squared are: 1, 4, 9, 36, 49, 196, 441, 1764. The sum of the squared divisors is 2500 which is 50 * 50, a square!

Given two positive integers we want to find all integers between them whose sum of squared divisors is itself a square. 42 is such a number.

The result will be an array of arrays, each subarray having two elements, first the number whose squared divisors is a square and then the sum of the squared divisors.
=end

p list_squared(1, 250) == [[1, 1], [42, 2500], [246, 84100]]
p list_squared(42, 250) == [[42, 2500], [246, 84100]]
p list_squared(250, 500) == [[287, 84100]]