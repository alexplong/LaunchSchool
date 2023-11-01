=begin
Difficulty: medium

Find the longest substring in alphabetical order.

Example: 
the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" is "aaaabbbbctt".

Notes
- There are tests with strings up to 10 000 characters long so your code will need to be efficient.
- The input will only consist of lowercase characters and will be at least one letter long.
- If there are multiple solutions, return the one that appears first.

=end

p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') == 'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') =='fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'