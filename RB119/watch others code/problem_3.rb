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

def next_bigger_num(number)
  output = []
  digits_length = number.to_s.length
  number.to_s.chars.map(&:to_i).permutation(digits_length) do |variant| 
    variant = variant.join.to_i
    output << variant if variant > number
  end

  output.min || -1

end


p next_bigger_num(9) == -1
p next_bigger_num(12) == 21
p next_bigger_num(513) == 531
p next_bigger_num(2017) == 2071
p next_bigger_num(111) == -1
p next_bigger_num(531) == -1
p next_bigger_num(123456789) == 123456798

## time 25 min