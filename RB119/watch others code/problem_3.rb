=begin
You have to create a method that takes a positive integer number and returns
the next bigger number formed by the same digits:
12 ==> 21
513==> 531
2017==> 2071
If no bigger number can be composed using those digits, return -1:
9 ==> -1
111 ==> -1
531 ==2 -1
=end

=begin
# Problem
- input: a positive integer
- output: the next bigger integer formed by same digits or -1

Requirements/Questions?
- can convert integer to string? yes
- 

# Examples

2017:
[2071, 7012, 7021, 7102, 7120, 7210, 7201]

# Data Structures
- Integer: input
- Integer: output
- Array: all integer forms greater than input


# Algorithm
- Create an output variable and set to an empty array
- Transform integer to an array to integers
- Determine all permutations from array of integers that are the length of the size of the current array
- Iterate through permutations
  - Join each current permutation array back to an integer
  - Add current permutation to output array if current permutation value is greater than input value
- Return the minimum value from the input array if available if truthy otherwise return -1
=end

# def next_bigger_num(number)
#   output = []
#   digits_length = number.to_s.length

#   # number.to_s.chars.map(&:to_i).permutation(digits_length) do |variant| 

#   number.digits.permutation(digits_length) do |variant| 
#     variant = variant.join.to_i
#     output << variant if variant > number
#   end

#   output.min || -1

# end

=begin
What if permutation not available for use? What algorithm would you develop to answer this question?

Model of Algorithm update v1 
# similar to previous algorithm 
# we generate all number patterns of given number 
# but just use different methods
- can get array of all number variants
- filter/select only those greater than input 
- return min of selected or -1

Update v2
- idea of method is to get the "next" bigger number
- ideally, want to start at the end of the number. why?
  - swapping numbers from beginning will be "higher" numbers vs those at end which are "smaller"
  - next would be to keep the first (or left side) number the same and the rest, 'the next largest' 
    - so sorting from the right

Algorithm v2
- Given an integer
- Transform integer to an array of integers
- Each integer in integers
  - 

EXAMPLES after watching video
54681 => largest number "out of bounds" of given is 100000
51682 => increment by 1 up to out of bounds number previously mentioned
  ... => and check if digits sorted equal to sorted given input

DATA STRUCTURE after watching video
- 1 Integer: input
- 1 Integer: output
- 1 Integer: largest "out of bounds" value of given input
- 2 Arrays: Array of Integers from next num and given num

ALGORITHM after watching video
- Given an Integer as input
- Initialize next num variable and set to given Integer input + 1
- Initialize max num variable and set to the largest "out of bounds" number from given Integer
- While next num is less than max num
  - Get digits Array from next num and sort it
  - Get digits Array from input and sort it
  - If next num Array is equal to given input Array return next num
  - Increment next num by 1
- Return -1
=end

def next_bigger_num(int)
  next_num = int + 1
  max_num = int.digits.sort.reverse.join.to_i + 1

  while next_num < max_num
    return next_num if next_num.digits.sort == int.digits.sort

    next_num += 1
  end

  -1
end


p next_bigger_num(9) == -1
p next_bigger_num(12) == 21
p next_bigger_num(513) == 531
p next_bigger_num(2017) == 2071
p next_bigger_num(111) == -1
p next_bigger_num(531) == -1
p next_bigger_num(123456789) == 123456798
p next_bigger_num(54681)
p next_bigger_num(54618)

## time 25 min