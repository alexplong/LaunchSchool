p (File.open(ARGV[0]).sum do |line|

  num_words = {'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4', 'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'}
  num_words_regexp = Regexp.new(num_words.keys.join('|'))
  walker = 0

  result = []

  (0...line.size).each do |runner|
    if line[runner].match?(/[0-9]/)
      result << line[runner]
      walker = runner + 1
    else
      substr = line.slice(walker..runner)
      if substr.match?(num_words_regexp)
        word = substr.scan(num_words_regexp).first
        num = num_words[word]
        result << num
        walker = runner + 1
      end
    end
  end

  # line = line.scan(/[0-9]/)
  p line
  p result

  first_first = (result.first + result.first).to_i
  first_last = (result.first + result.last).to_i

  # result.size == 1 ? (result.first + result.first).to_i : (result.first + result.last).to_i
  result.size == 1 ? first_first : first_last
end
)




=begin
input: a string
output: an integer

RULES
- Given a string of alphanumeric characters
- Parse out the Integers among the given characters
- Get the first and last digit among the Integers to form a single two-digit number
  - If there is only one Integer digit, duplicate that digit to form the two-digit number
- Get the sum of all these two-digit numbers

RULES for 2
- Given a string of alphanumeric characters
- Parse out the integers or numbers as formed by multiple chars (ie. "one" => 1, "two" => 2, etc.)
  - Be careful of overlapping strings and order of iteration, ie "eightwo" will likely reveal a '2' first when '8' should be returned
- Repeat similar to previous

EXAMPLE
## SubProblem 1
eightwothree  # Iterate to find substring that matches then replace it with Integer
    ^         

8wothree      # Iterate to find that next substring that matches
 ^

8wothree      # Replace matching substring with Integer
       ^      

8wo3

ALGORITHM
- Given a string of alphanumeric characters
- Create a reference hash where key is the String word version of Integer and value is the String Integer
- Create a RegExp from the keys of the reference hash
- Create a local variables walker and set it to 0
- Create local variable result and set it to an empty array
- Iterate from a range of 0 to size of given string exclusively - runner
  - If char at index runner is a number
    - Append number to result array
    - Reassign walker to current runner value
  - Else
    - Get substring from range walker to runner inclusively
    - Check if substring matches from RegExp of keys and if true
      - Get the string from the substring
      - Get the accompanying number from the reference hash
      - Append the number to the result array
      - Reassign walker to current runner value
      # - Substitute the input string with the number         # Likely bug messing with size thus iteration can lead to unexpected results
- Parse out the integers from the string

=end