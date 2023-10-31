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
  - Method takes Regexp 
  - Regexp /[aeiou]+/ where [aeiou] means a single char of: a, e, i, o, or u and + means one or more of previous mentioned set 

ALGORITHM
- Given a String as input
- Get an Array of vowel only substrings from String input (String#scan)
- Transform String in Array to its size
- Return the max size from Array

DATA STRUCTURES w/out String#scan
- Array: referenced by a Constant containing vowel characters 
- Integer: dynamic variable that count of longest vowel substring
- Integer: counter to reference index of String

ALGORITHM w/out String#scan
- Create a Constant and set to Array of vowel strings a, e, i, o, u
- Given a String as input
- Create longest_vowel variable and set to 0
- Create counter variable and set to 0
- Create a loop
  - break if referencing Array with counter + 1 returns nil
  - If character in String at counter is not a vowel
    - Increment counter by 1
    - Go to next iteration
  - Create a scoped variable vowel_count and set to 1
  - Initiate a nested loop
    - Check if character at counter + 1 is a vowel
      - If true 
        - Increment vowel_count by 1
        - Increment counter by 1
    - Else break out of loop (counter + 1 is nil)
  - Reassign longest_vowel to vowel_count if vowel_count is greater than longest_vowel
  - Increment counter by 1
- Return longest_vowel

ALGORITHM simplified?
- Given a String as input
- Transform String to an Array of characters
- Iterate over Array with Map to transform non vowels to whitespace
  - Check if character is a vowel
  - Return character if true
  - Else return whitespace " " character
- Join Array to String and remove leading and trailing whitespace from String
- Split transformed String by whitespace to get Array of vowel substrings
- Transform Strings in Array to an Array of String length
- Return max element in Array
=end

## String#scan solution
# def solve(str)
#   str.scan(/[aeiou]+/).map(&:size).max
# end

## Dynamic Programming solution
# VOWELS = %w(a e i o u)

# def solve(str)
#   longest_vowel, counter = 0, 0
  
#   loop do
#     break if str[counter + 1].nil?
#     unless VOWELS.include?(str[counter])
#       counter += 1
#       next
#     end

#     vowel_count = 1
    
#     loop do
#       if VOWELS.include?(str[counter + 1])
#         vowel_count += 1
#         counter += 1
#       else
#         break
#       end
#     end

#     longest_vowel = vowel_count if vowel_count > longest_vowel
#     counter += 1
#   end

#   longest_vowel
# end


def solve(str)
  str.chars.map do |char|
    if char.match?(/[aeiou]/)
      char
    else
      " "
    end
  end
  .join.strip.split.map(&:size).max
end


p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvgheaae") == 4
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5
p solve("iiihoovaeaaaoougjyaw") == 8










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

# VOWELS = %w(a e i o u)

# def solve(str)

#   output = 0
#   counter = 0

#   loop do
#     break if counter == str.length
#     if VOWELS.include?(str[counter]) == false
#       counter += 1
#       next
#     end

#     temp_vowel = str[counter]

#     while str[counter + 1] && VOWELS.include?(str[counter + 1])
#       counter += 1
#       temp_vowel << str[counter]
#     end

#     output = temp_vowel.length if temp_vowel.length > output
#     counter += 1
#   end

#   output

# end

# p solve("codewarriors") == 2
# p solve("suoidea") == 3
# p solve("iuuvgheaae") == 4
# p solve("ultrarevolutionariees") == 3
# p solve("strengthlessnesses") == 1
# p solve("cuboideonavicuare") == 2
# p solve("chrononhotonthuooaos") == 5
# p solve("iiihoovaeaaaoougjyaw") == 8

# run code earlier and declare what you expect from early code snippets


