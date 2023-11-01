=begin
Difficulty: medium

Complete the solution so that it returns the number of times the search_text
is found within the full_text.

Usage example:

solution('aa_bb_cc_dd_bb_e', 'bb') # should return 2 since bb shows up twice

solution('aaabbbcccc', 'bbb') # should return 1

=end

p solution('abcdeb','b') == 2
p solution('abcdeb', 'a') == 1
p solution('abbc', 'bb') == 1
