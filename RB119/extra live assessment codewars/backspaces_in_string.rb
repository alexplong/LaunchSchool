=begin
Difficulty: medium

Assume "#" is like a backspace in string. This means that string "a#bc#d" actually is "bd"

Your task is to process a string with "#" symbols.

Examples "abc#d##c" ==> "ac" "abc##d######" ==> "" "#######" ==> "" "" ==> ""
=end

p clean_string('abc#d##c') == "ac" p clean_string('abc####d##c#') == ""
p clean_string('abc####d##c#') == ""
