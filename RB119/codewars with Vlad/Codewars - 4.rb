=begin
The vowel substrings in the word codewarriors are o,e,a,io. 
The longest of these has a length of 2. 
Given a lowercase string that has alphabetic characters only (both vowels and consonants) 
and no spaces, return the length of the longest vowel substring. Vowels are any of aeiou.

Good luck!
=end

=begin
- input: string
- output: integer

RULES
Explicit:
- Given only lowercase string with alphabetic chars only and no spaces
- Return length of the longest vowel substring # 'ae' will return 2
- vowels are any of aeiou
Implicit:
- If string contains no vowels, return 0

MENTAL MODEL
- Scan/iterate through string looking for substrings that contain only vowels
- Count length of longest substring
- Return the count

DATA STRUCTURES
- Array: `#scan` with Regexp , can use method to return an array of vowel substrings
=end




=begin
## Before Refactoring
algorithm
- create a constant array containing all vowel characters
- given a string as input
- initialize output and set to 0
- initialize a counter and set to 0
- create a loop to iterate through the string
  - break when counter equal to length of input
  - if curr character is not a vowel
    - increment counter by 1
    - next iteration
  - initialize temp_vowel and set to curr character
  - while loop where element at counter + 1 is not nil and next character is a vowel
    - increment counter by 1
    - append curr character to temp_vowel
  - reassign output to length of temp_vowel if output is zero or if length of temp_vowel is greater than output
  - increment counter by 1
- return output

=end

VOWELS = %w(a e i o u)

def solve(str)

  output = 0
  counter = 0

  loop do
    break if counter == str.length
    if VOWELS.include?(str[counter]) == false
      counter += 1
      next
    end

    temp_vowel = str[counter]

    while str[counter + 1] && VOWELS.include?(str[counter + 1])
      counter += 1
      temp_vowel << str[counter]
    end

    output = temp_vowel.length if temp_vowel.length > output
    counter += 1
  end

  output

end

# p solve("codewarriors") == 2
# p solve("suoidea") == 3
# p solve("iuuvgheaae") == 4
# p solve("ultrarevolutionariees") == 3
# p solve("strengthlessnesses") == 1
# p solve("cuboideonavicuare") == 2
# p solve("chrononhotonthuooaos") == 5
# p solve("iiihoovaeaaaoougjyaw") == 8

# run code earlier and declare what you expect from early code snippets


