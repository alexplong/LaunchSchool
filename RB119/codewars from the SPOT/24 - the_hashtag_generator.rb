=begin
Difficulty: medium

The marketing team is spending way too much time typing in hashtags.
Let's help them with our own Hashtag Generator!

Here's the deal:

It must start with a hashtag (#).
All words must have their first letter capitalized.
If the final result is longer than 140 chars it must return false.
If the input or the result is an empty string it must return false.

Examples
" Hello there thanks for trying my Kata"  =>  "#HelloThereThanksForTryingMyKata"
"    Hello     World   "                  =>  "#HelloWorld"
""                                        =>  false

input: a string
output: a new string or false

RULES
- Given a string
- Return a new string w/ hashtag and no spaces where each word is capitalized
- Return false if string is empty or final string is greater than 140 chars

ALGORITHM
- Given a string
- Split the string and get an array of words
- If the array is empty immediately return false
- Transform each word in the array to its capitalized form
- Prepend the array with a hashtag
- Join the array into a string
- Get length of string
- Return false if string length is greater than 140 else return string

=end

def generateHashtag(str)
  result = str.split.map(&:capitalize)
  return false if result.empty?

  result.unshift('#')
  result = result.join

  result.size > 140 ? false : result
end

p generateHashtag("") == false
p generateHashtag(" " * 200) == false
p generateHashtag("Do We have A Hashtag") == "#DoWeHaveAHashtag"
p generateHashtag("Codewars") == "#Codewars"
p generateHashtag("Codewars Is Nice") ==  "#CodewarsIsNice"
p generateHashtag("Codewars is nice") == "#CodewarsIsNice"
p generateHashtag("code" + " " * 140 + "wars") == "#CodeWars"
p generateHashtag("Looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong Cat") == false
p generateHashtag("a" * 139) == "#A" + "a" * 138
p generateHashtag("a" * 140) == false
