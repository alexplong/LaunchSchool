=begin
Difficulty: medium

Given a certain string, create a hash with each character in string as key andall possible substrings in string starting at each character as value.

=end
p consecutive_runs('abcd') == {"a"=>["a", "ab", "abc", "abcd"], 
                               "b"=>["b", "bc", "bcd"], 
                               "c"=>["c", "cd"], 
                               "d"=>["d"]}