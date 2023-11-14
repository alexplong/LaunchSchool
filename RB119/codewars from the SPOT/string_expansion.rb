=begin
Given a string that includes alphanumeric characters ("3a4B2d") return the expansion of that string: The numeric values represent the occurrence of each letter preceding that numeric value. There should be no numeric characters in the final string.

The first occurrence of a numeric value should be the number of times each character behind it is repeated, until the next numeric value appears. If there are multiple consecutive numeric characters, only the last one should be used (ignore the previous ones).
=end

string_expansion("3D2a5d2f") == "DDDaadddddff"
string_expansion("3abc") == "aaabbbccc"
string_expansion("3d332f2a") == "dddffaa"
string_expansion("abcde") == "abcde"
string_expansion("1111") ==  ""
string_expansion("") ==  ""