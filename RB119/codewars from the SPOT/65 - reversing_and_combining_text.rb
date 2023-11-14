=begin
Difficulty: ___

Your task is to Reverse and Combine Words.

Input: String containing different "words" separated by spaces

1. More than one word? 
    - Reverse each word and combine first with second, third with fourth and so on...
    - (odd number of words => last one stays alone, but has to be reversed too)
2. Start it again until there's only one word without spaces
3. Return your result…


Input: a string
Output: a string

RULES
- Pass by value
- Given a string that can contain more than one word
  - each word and combine first with second, third with fourth and so on...
  - (odd number of words => last one stays alone, but has to be reversed too)

Implicit:
- If one word in string just return string

EXAMPLES
"abc def ghi jkl"
"cba fed ihg lkj"
"cbafed ihglkj"
"defabc jklghi"
"defabcjklghi"

"abc def ghi jkl xyz"
"cba fed ihg lkj zyx"
"cbafed ihglkj zyx"
"defabc jklghi xyz"
"defabcjklghi xyz"
"ihhlkjcbafedxyz"

ALGORITHM
- return string if length of string to an array is 1
- Initalize a result array and set to empty
- Given a string
- Split string into an array of words
- Transform and reverse each word in array
- Initialize a counter and set to 0
- Create a loop
  - If counter + 1 is nil push element at counter to result array
  - else
    - Join element in arr at counter and counter + 1 together
    - Push that string to result array
  - Increment counter by 2
  - Break if counter is greater or equal to length of array

- call self with output transformed to string as argument if length of output is greater than 1
- Return first element of result array
=end

def reverse_and_combine_text(str)
  return str if str.split.size == 1
  result = []

  str_arr = str.split.map(&:reverse)

  counter = 0

  loop do
    if str_arr[counter + 1] == nil
      result << str_arr[counter] 
    else
      result << (str_arr[counter] + str_arr[counter + 1]) 
    end
    counter += 2
    break if counter >= str_arr.size
  end

  reverse_and_combine_text(result.join(' '))  #if result.size > 1

  # if result.size > 1
  #   reverse_and_combine_text(result.join(' ')) 
  # else
  #   result.first
  # end
end

p reverse_and_combine_text("abc def") #== "cbafed"
p reverse_and_combine_text("abc def ghi jkl") #== "defabcjklghi"
p reverse_and_combine_text("dfghrtcbafed") == "dfghrtcbafed"
p reverse_and_combine_text("234hh54 53455 sdfqwzrt rtteetrt hjhjh lllll12  44") == "trzwqfdstrteettr45hh4325543544hjhjh21lllll"
p reverse_and_combine_text("sdfsdf wee sdffg 342234 ftt") == "gffds432243fdsfdseewttf"
