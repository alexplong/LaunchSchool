=begin
Difficulty: medium

Given an array of n positive integers and a positive integer s, find the minimal length of a contiguous subarray of which the sum ≥ s. If there isn't one, return 0 instead.
=end

p minSubLength([2,3,1,2,4,3], 7) == 2
p minSubLength([1, 10, 5, 2, 7], 9) == 1
p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
p minSubLength([1, 2, 4], 8) == 0