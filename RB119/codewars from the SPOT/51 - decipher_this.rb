=begin
Difficulty: ___

You are given a secret message you need to decipher. Here are the things you need 
to know to decipher it:

For each word:

- The second and the last letter is switched (e.g. Hello becomes Holle)
- The first letter is replaced by its character code (e.g. H becomes 72)

Note: there are no special characters used, only letters and spaces

Examples

decipherThis('72olle 103doo 100ya'); # => 'Hello good day'
decipherThis('82yade 115te 103o');   # => 'Ready set go'

input: a string
output: a new string

RULES
- Given a string, decipher each word:
  - For each word, the 2nd and the last letter is switched (e.g. Hello becomes Holle)
  - For each word, the first letter is replaced by its character code (e.g. H becomes 72)
- No special chars used
- Only letters and spaces

Implicit:
- If word is only 2 chars long, 2nd and last letter switching is the same
- letters to numbers is #oct
- numbers to letters is #chr

ALGORITHM
- Given a string to decipher
- Transform string into an array of words
- Iterate through each word in array for transformation
  - Iterate through each char in word with a nested array object
    - If char is a number push to first array in nested array
    - If char is a letter push to second array in nested array
  - Join digits in first array of nested arr and transform to letter using (#chr)
  - In the second array of nested arr
    - Shift the first element and save it as 2nd letter
    - Pop the last element and unshift back to array
    - Push the 2nd letter back into the array (shifted out)
  - Flatten the array and join
- Join array back to string with spaces and return it
=end

def decipher_this(text)
  new_text = text.split.map do |word|
      new_word = word.chars.each_with_object([[],[]]) do |char, new_word|

                  if char.match?(/[0-9]/)
                    new_word[0] << char 
                  else
                    new_word[1] << char
                  end
      end  

      new_word[0] = new_word[0].join.to_i.chr
      new_word[1][0], new_word[1][-1] = new_word[1][-1], new_word[1][0]
      # second_letter = new_word[1].shift
      # new_word[1].unshift(new_word[1].pop)
      # new_word[1].push(second_letter)
      new_word.flatten.join
  end.flatten.join(' ')
end


def decipher_this(str)
  str.split.map do |word| 
    word = word.scan(/[0-9]+|[a-z]+/i) 
    if word.size == 1
      word[0].to_i.chr
    else
      word[1][0], word[1][-1] = word[1][-1], word[1][0]
      word[0].to_i.chr + word[1]
    end
  end.join(' ')

end

p decipher_this("65 119esi 111dl 111lw 108dvei 105n 97n 111ka") == "A wise old owl lived in an oak"
p decipher_this("84eh 109ero 104e 115wa 116eh 108sse 104e 115eokp") == "The more he saw the less he spoke"
p decipher_this("84eh 108sse 104e 115eokp 116eh 109ero 104e 104dare") == "The less he spoke the more he heard"
p decipher_this("87yh 99na 119e 110to 97ll 98e 108eki 116tah 119esi 111dl 98dri") == "Why can we not all be like that wise old bird"
p decipher_this("84kanh 121uo 80roti 102ro 97ll 121ruo 104ple") == "Thank you Piotr for all your help"
