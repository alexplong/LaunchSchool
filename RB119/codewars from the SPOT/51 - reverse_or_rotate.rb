=begin
Difficulty: ___

The input is a string str of digits. Cut the string into chunks (a chunk here is
a substring of the initial string) of size sz (ignore the last chunk if its size
is less than sz).

If a chunk represents an integer such as the sum of the cubes of its digits is
divisible by 2, reverse that chunk; otherwise rotate it to the left by one
position. Put together these modified chunks and return the result as a string.

If sz is <= 0 or if str is empty return ""
If sz is greater (>) than the length of str it is impossible to take a chunk of size sz hence return "".

Examples:

  revrot("123456987654", 6) --> "234561876549"
  revrot("123456987653", 6) --> "234561356789"
  revrot("66443875", 4) --> "44668753"
  revrot("66443875", 8) --> "64438756"
  revrot("664438769", 8) --> "67834466"
  revrot("123456779", 8) --> "23456771"
  revrot("", 8) --> ""
  revrot("123456779", 0) --> "" 
  revrot("563000655734469485", 4) --> "0365065073456944"

=end

=begin
input: a string and an integer
output: a string

RULES
- Given a string and a number
- Get substrings of number size
- Reverse substring if the sum of the cubes of its digits is divisible by 2
  - Else rotate it to the left by one
- Return that new string

ALGORITHM
- Given a string and an integer
- Get a collection of substrings of integer size
  - If substring > sum of it is cubes of its digits is divisible by 2 reverse it
  - Otherwise rotation by 1
- Join the substrings togetehr and return string

=end

def revrot(str, n)
  collection = []
  counter = 0

  while counter < str.size
    substr = str.slice(counter, 5)

    if substr.size < 5
      collection << substr
    elsif substr.chars.map(&:to_i).sum % 2 == 0
      collection << substr.reverse
    else
      substr[0], substr[-1] = substr[-1], substr[0]
      substr
    end

    counter += 5
  end

  collection.join
end

p revrot("1234", 0) == ""
p revrot("", 0) == ""
p revrot("1234", 5) == ""
p revrot("733049910872815764", 5) == "330479108928157"
p revrot("123456987654", 6) == "234561876549"
p revrot("123456987653", 6) == "234561356789"
p revrot("66443875", 4) == "44668753"
p revrot("66443875", 8) == "64438756"
p revrot("664438769", 8) == "67834466"
p revrot("123456779", 8) == "23456771"
p revrot("", 8) == ""
p revrot("123456779", 0) == ""
p revrot("563000655734469485", 4) == "0365065073456944"
