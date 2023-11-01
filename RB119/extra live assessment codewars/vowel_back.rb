=begin
Difficulty: medium

You need to play around with the provided string (s).
Move consonants forward 9 places through the alphabet. If they pass ‘z’, start again at ‘a’. Move vowels back 5 places through the alphabet. If they pass ‘a’, start again at ‘z’. Provided string will always be lower case, won’t be empty and will have no special characters.
=end

p vowel_back("testcase") == "czbclvbz"
p vowel_back("codewars") == "ljmzfvab"
p vowel_back("exampletesthere") == "zgvvyuzczbcqzaz"
p vowel_back("returnofthespacecamel") == "azcpawjocqzbyvlzlvvzu"
p vowel_back("bringonthebootcamp") == "kadwpjwcqzkjjclvvy"
p vowel_back("weneedanofficedog") == "fzwzzmvwjoodlzmjp"