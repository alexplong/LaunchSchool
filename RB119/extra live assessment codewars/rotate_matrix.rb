=begin
Difficulty: medium

Given a matrix represented as a list of string, such as

###.....
..###...
....###.
.....###
.....###
....###.
..###...
###.....
write a function rotateClockwise(matrix) that return its 90° clockwise rotation, for our example:

#......#
#......#
##....##
.#....#.
.##..##.
..####..
..####..
...##...
=end

p rotateClockwise(["abc", "def"])) #, ["da", "eb", "fc"]);
p rotateClockwise(["c","b","a"])) #, ["abc"]);
p rotateClockwise(["cba"])) # ["c","b","a"]);
p rotateClockwise(["a", "b", "c"])) #, ["cba"]);