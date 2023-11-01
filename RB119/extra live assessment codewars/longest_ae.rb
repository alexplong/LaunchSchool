=begin
Difficulty: medium

Find the length of the longest substring in the given string that contains exatly 2 characters "a" and 2 characters "e" in it.

As an example, if the input was “aaee”, the substring (aaee) length would be 4. For a string "babanctekeaa", the longest substring is "babancteke" and its length is 10.

If the length of the input string is 0, return value must be -1 and if none of the substrings contain 2 "a" and "e" characters return -1 as well.
=end

p longest_ae("aaee") == 4
p longest_ae("babanctekeaa") == 10
p longest_ae("xenoglossophobia") == -1
p longest_ae("pteromerhanophobia") == 18
p longest_ae("johannisberger") == -1
p longest_ae("secaundogenituareabb") == 16