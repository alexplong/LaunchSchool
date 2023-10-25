=begin
Complete the greatestProduct method so that it'll find the greatest product of five consecutive digits in the given string of digits.

For example:

greatestProduct("123834539327238239583") // should return 3240

The input string always has more than five digits.

Adapted from Project Euler.

# Problem
- input: a string of integers
- output: integer

Requirements/Questions?
- find greatest product of 5 consecutive digits in string of digits

Mental Model
- From the String
- Get all substrings of 5 consecutive integer strings
- Convert those integer strings to integers and multiply them
- Update an output variable if the returned is greater than current product
- Return product

# Ex
- all should return true

# Data Structures
-

# Algorithm
- Create an output varaible and set it to 0
- Given a string of integers
- Get all substrings that are 5 characters in length and store in Array
- Iterate through all substrings
  - Convert substrings to an array of integers and get product of all integers
  - Compare current product to output integer and update output if current is greater than output
- Return output

Get all substrings
- Given a string
- Iterate through String
  - Get substring that is 5 chars in length starting from current index
  - Append substring to an Array
  - Break if substring length is less than 5
- Return Array
=end



def greatest_product(n)
  output = 0

  substrings = []

  counter = 0
  loop do
    break if n[counter, 5].length < 5
    substrings << n[counter, 5]
    counter += 1
  end

  substrings.each do |substr|
    product = 1
    substr.chars.map(&:to_i).each do |n|
      product *= n
    end
    output = product if product > output
  end

  output

end

p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0

## get back to Algorithm 