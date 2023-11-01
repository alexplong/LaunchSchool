=begin
Difficulty: medium

Write a method to find the longest common prefix string amongst an array of strings. If there is no common prefix, return an empty string,

All given inputs are in lowercase letters a-z.

=end

puts common_prefix(["flower", "flow", "flight"]) == "fl" 
puts common_prefix(["dog", "racecar", "car"]) == "" 
puts common_prefix(["interspecies", "interstellar", "interstate"]) == "inters" 
puts common_prefix(["throne", "dungeon"]) == "" 
puts common_prefix(["throne", "throne"]) == "throne"