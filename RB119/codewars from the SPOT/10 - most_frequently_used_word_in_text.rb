=begin
Difficulty: hard

Write a function that, given a string of text (possibly with punctuation and 
line-breaks), returns an array of the top-3 most occurring words, in descending
 order of the number of occurrences.

Assumptions:
- A word is a string of letters (A to Z) optionally containing one or more 
  apostrophes (') in ASCII. (No need to handle fancy punctuation.)
- Matches should be case-insensitive, and the words in the result should be 
  lowercased.
- Ties may be broken arbitrarily.
- If a text contains fewer than three unique words, then either the top-2 or 
  top-1 words should be returned, or an empty array if a text contains no 
  words.

Examples:
  top_3_words("In a village of La Mancha, the name of which I have no desire to call to
  mind, there lived not long since one of those gentlemen that keep a lance
  in the lance-rack, an old buckler, a lean hack, and a greyhound for
  coursing. An olla of rather more beef than mutton, a salad on most
  nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
  on Sundays, made away with three-quarters of his income.")
  # => ["a", "of", "on"]

  top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e")
  # => ["e", "ddd", "aa"]

  top_3_words("  //wont won't won't")
  # => ["won't", "wont"]

Bonus points (not really, but just for fun):
- Avoid creating an array whose memory footprint is roughly as big as the input text.
- Avoid sorting the entire array of unique words.

input: a string (with punc and potential line breaks)
output: an array containing 3 strings

RULES
- Given a string that can contain punc and line-breaks
- Return an array of the top-3 most occurring words
  - in descending order with words all in lowercase
  - can break ties arbitrarily
- case-insensitive for matches
- if text contains less than 3 unique words
  - then return either top-2 or top-1 words
  - or empty array if no words



ALGORITHM
- Given a string
- Get an array of words from the given downcased string where words are split by ' ' or '-'
- Create a hash of the count of the words from the array
    - Key - word ; value - count of words in string
- Sort the hash collection by value in descending order (convert arr back to hash)
- Select the top 3 keys in the hash that have the highest value
- Return those 3 keys in an array

=end

def top_3_words(str)
  str.downcase.scan(/[a-z']+/).select {|word| word.match(/[a-z]/)}.tally.sort_by {|k, v| -v}.to_h.keys.first(3)
end

























def top_3_words(str)
  words = str.downcase.scan(/[a-z']+/).reject { |word| word[0] == "'" && word[-1] == "'"}
  words.uniq.map do |word|
    [word, words.count(word)]
  end.sort_by do |subarr|
    -subarr[1]
  end.to_h.keys.first(3)
end

p top_3_words("a a a  b  c c  d d d d  e e e e e") == ["e", "d", "a"]
p top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e") == ["e", "ddd", "aa"]
p top_3_words("  //wont won't won't ") == ["won't", "wont"]
p top_3_words("  , e   .. ") == ["e"]
p top_3_words("  ...  ") == []
p top_3_words("  '  ") == []
p top_3_words("  '''  ") == []
p top_3_words("""In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income.""") == ["a", "of", "on"]
