=begin
Difficulty: medium

A string is considered to be in title case if each word in the string is either 
(a) capitalised (that is, only the first letter of the word is in upper case) 
or (b) considered to be an exception and put entirely into lower case unless it 
is the first word, which is always capitalised.

Write a function that will convert a string into title case, given an optional 
list of exceptions (minor words). The list of minor words will be given as a 
string with each word separated by a space. Your function should ignore the 
case of the minor words string -- it should behave in the same way even if the 
case of the minor word string is changed.

=end

=begin
input: pair of strings
output: a string

RULES
- Given a string to transform and an optional string of words
- Capitalize the first word and all words not included in the optional words string
- Return the new string

ALGORITHM
- Given a string of words to transform and an optional words in a string to ignore
- Transform optional string into an array if available
- Transform string into an array of words
- Iterate through string of words
  - If word is first word
    - Capitlize word
  - If word is in optinal list
    - Downcase word
  - Else
    - Capitlze word
- Join the array of words back to a string
- Return the string

=end

# def title_case(str, list='')
#   words = str.split
#   optional = list.downcase.split

#   words.map.with_index do |word, idx|
#     if idx == 0
#       word.capitalize
#     elsif optional.include?(word.downcase)
#       word.downcase
#     else
#       word.capitalize
#     end
#   end.join(' ')

# end


def title_case(str, str_list='')
  str.downcase.split.map.with_index do |word, i|
    if i == 0 && str_list.downcase.include?(word.downcase)
      word.capitalize 
    elsif str_list.downcase.include?(word.downcase) 
      word.downcase 
    else
      word.capitalize
    end
  end.join(' ')

end

p title_case('a clash of KINGS', 'a an the of') == 'A Clash of Kings'
p title_case('THE WIND IN THE WILLOWS', 'The In') == 'The Wind in the Willows'
p title_case('the quick brown fox') == 'The Quick Brown Fox'
