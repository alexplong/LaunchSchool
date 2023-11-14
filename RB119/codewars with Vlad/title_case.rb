=begin
A string is considered to be in title case if each word in the string is either:
(a) capitalised (that is, only the first letter of the word is in upper case) or
(b) considered to be an exception and put entirely into lower case unless it is the first word, which is always capitalised.

Write a function that will convert a string into title case, given an optional list of exceptions (minor words).
The list of minor words will be given as a string with each word separated by a space.
Your function should ignore the case of the minor words string.
It should behave in the same way even if the case of the minor word string is changed.

Arguments
First argument (required): the original string to be converted.
Second argument (optional): space-delimited list of minor words that must always be lowercase except for the first word in the string. 
=end

=begin
Input: a string with an optional 2nd string which are list of exceptions
Output: a new string

RULES
Explicit:
- title case? if word in string is either:
  - word is capitalized (only 1st letter of word is in uppercase)
  - word considered to be an exception and put entirely into lowercase
    - UNLESS it is the first word -> always capitalized
- exception words are given in string in 2nd optional argument (case of minor words don't matter)

Implicit:
- Pass by value

EXAMPLES

DATA STRUCTURE
-

MENTAL MODEL
- Iterate through each word in string (array easier) 
- Check index of curr word and check if its included in minor_words
- If index is 0 for word, capitalize that word
- If index for word is not 0 AND it's not a substr in the minor_words str
  - That word will be downcased and capitalized
- If index for word is not 0 AND it IS a substr in the minor_words str
  - That word will be downcased
- Add all those words to a new_str and return it

ALGORITHM
- Initialize a new string variable and set to empty Array
- Transform minor_words to downcase form destructively
- Reassign input string to downcase transformed versions
- Given a string as input and a minor_words opt str
- Transform input string to an Array
- Iterate through words Array with index
  - Check index of curr word is 0 and if curr word is in minor_str
    - If index of curr word is 0
      - Downcase and capitalize that word and append word to new string Array
    - If index is not 0 and curr word is in minor_str
      - Downcase that word and append word to new string Array
    - If index is not 0 and curr word is NOT in minor_str
      - Downcase and capitalize taht word and append word to new string Array
- Join new string Array to a string with spaces in between each element
- Return that string

=end

def title_case(title, minor_words = '')
  new_string = []
  minor_words.downcase!
  title = title.downcase

  title_arr = title.split
  title_arr.each_index do |i|
    if i == 0
      new_string << title_arr[i].downcase.capitalize
    elsif minor_words.include?(title_arr[i])
      new_string << title_arr[i].downcase
    else
      new_string << title_arr[i].downcase.capitalize
    end
  end

  new_string.join(' ')
end

p title_case('a clash of KINGS', 'a an the of') == 'A Clash of Kings'
p title_case('THE WIND IN THE WILLOWS', 'The In') == 'The Wind in the Willows'
p title_case('the quick brown fox') == 'The Quick Brown Fox'