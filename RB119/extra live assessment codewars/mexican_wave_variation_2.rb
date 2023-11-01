=begin
Difficulty: hard

Your task is to create a method that turns a string into a wave (like at a stadium). 
You will be passed a string and you must return that string in an array where an 
uppercase letter is a person standing up.

Rules
- The input string will always be lower case but maybe empty.
- If the character in the string is whitespace then pass over it
- Leave each fourth letter unaltered—-do not make those letters uppercase

=end

p wave("hello") == ["Hello", "hEllo", "heLlo", "hello", "hellO"]
p wave("studying") == ["Studying", "sTudying", "stUdying", "studying", "studYing", "studyIng", "studyiNg", "studying"]
p wave("launch school") == ["Launch school", "lAunch school", "laUnch school", "launch school", "launCh school", "launcH school", "launch School", "launch school", "launch scHool", "launch schOol", "launch schoOl", "launch school"]
p wave("") == []