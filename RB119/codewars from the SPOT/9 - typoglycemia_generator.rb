=begin
Difficulty: hard

There is a message that is circulating via public media that claims a reader can
easily read a message where the inner letters of each words is scrambled, as 
longas the first and last letters remain the same and the word contains all the 
letters.

Another example shows that it is quite difficult to read the text where all the 
letters are reversed rather than scrambled.

In this kata we will make a generator that generates text in a similar pattern, 
but instead of scrambled or reversed, ours will be sorted alphabetically

Requirement

return a string where:
  1) the first and last characters remain in original place for each word
  2) characters between the first and last characters must be sorted alphabetically
  3) punctuation should remain at the same place as it started, for example: shan't -> sahn't

Assumptions

  1) words are seperated by single spaces
  2) only spaces separate words, special characters do not, for example: tik-tak -> tai-ktk
  3) special characters do not take the position of the non special characters, for example: -dcba -> -dbca
  4) for this kata puctuation is limited to 4 characters: hyphen(-), apostrophe('), comma(,) and period(.)
  5) ignore capitalisation

for reference: http://en.wikipedia.org/wiki/Typoglycemia
  
input: a string
output: a new string

RULES
- return a new string given that:
  1) the first and last characters remain in original place for each word
  2) characters between the first and last characters must be sorted alphabetically
  3) punctuation should remain at the same place as it started, for example: shan't -> sahn't

"shan't" => ["s", "h", "a", "n", "'", "t"] =(remove 1st,last,extra)=> ["h", "a", "n"] =sort/rev> ["n", "h", "a"]
"shan't"


ALGORITHM
- Given a string
- Get an array of words from the given string
- Iterate through each word from the array for transformation
  - Create a variable called 1st_char and set to false
  - Get an array of the sorted and reversed internal letters from given string (middle_chars)
    - Transform into an array of chars, remove 1st and last element, select only chars, sort, then reverse it
  - Create a loop to iterate through each char in word for transformation with index
    - If curr char is a letter and 1st_char is equal to false
      - set 1st_char to true
      - curr char
    - elsif curr char is NOT a letter
      - curr char
    # - elsif current index is equal to size of word - 1
    #   - curr char
    - elsif curr char is a letter and middle_chars array is NOT empty
      - pop element from middle_chars array 
    - else curr char
  - Join chars back together to word
- Join array back together to form string and return it
=end

def scramble_words(str)

  words = str.split

  words.map do |word|

    first_char = false
    middle_chars = word.chars.select { |char| char.match?(/[a-z]/i)}
    middle_chars.shift
    middle_chars.pop
    middle_chars.sort!
    middle_chars.reverse!

    word.chars.map.with_index do |char, idx|
      if char.match?(/[a-z]/i) && first_char == false
        first_char = true
        char
      elsif char.match?(/[a-z]/i) && !middle_chars.empty?
        middle_chars.pop
      else
        char
      end
    end.join

  end.join(' ')
end

p scramble_words('professionals') == 'paefilnoorsss'
p scramble_words('i') == 'i'
p scramble_words('') == ''
p scramble_words('me') == 'me'
p scramble_words('you') == 'you'
p scramble_words('card-carrying') == 'caac-dinrrryg'
p scramble_words("shan't") == "sahn't"
p scramble_words('-dcba') == '-dbca'
p scramble_words('dcba.') == 'dbca.'
p scramble_words("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's nobody listening, and live like it's heaven on earth.") == "you've gotta dacne like teehr's nbdooy wachintg, love like ylo'ul neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth."
