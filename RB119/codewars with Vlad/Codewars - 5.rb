# Given a string of integers, return the number of odd-numbered substrings that can be formed.

# For example, in the case of "1341", they are 1, 1, 3, 13, 41, 341, 1341, a total of 7 numbers.

# solve("1341") = 7. See test cases for more examples.

=begin
input: string of integers
output: integer

rules/questions
- return number of odd-numbered substrings formed
- odd-numbered substrings? continous

data structures
- Array: collection of all odd substrings

# algorithm
# - given a string of integers
# - get all permutations of the digits of size 1 to size length of string
# - store all odd permutations in an array
# - return count of permutations array

# get all permutations helper method
# - create an output varaible and set to empty array
# - initialize a counter and set to 1
# - given a string of integers
# - split integers into an array 
# - create a loop
#   - call permutation on the input string and pass in counter as argument
#     - join all permutations and convert to an integer
#     - append permutations to output if integer is odd
#   - increment counter by 1
#   - break when counter > length of input str
# - return output

=up
=end




# def get_odd_permutations(str)
#   output = []
#   counter = 1
#   str = str.chars

#   loop do
#     str.permutation(counter) do |variant|
#       variant = variant.join.to_i
#       output << variant if variant.odd?
#     end

#     counter += 1
#     break if counter > str.length
#   end

#   output
# end

# def solve(input)
#   odd_permutations = get_odd_permutations(input)
#   odd_permutations.count
# end


=begin
- initialize a result var and set to empty array
- initialize two counters: walker, runner and set to 0
- slice substring from range walker..runner
- check if substring is odd

=end

# p solve("1341") #== 7
# p solve("1357") #== 10
# p solve("13471") #== 12
# p solve("134721") #== 13
# p solve("1347231") #== 20
# p solve("13472315") #== 28



## first 30 min

## next 30 min
# Given a string of integers, return the number of odd-numbered substrings that can be formed.

# For example, in the case of "1341", they are 1, 1, 3, 13, 41, 341, 1341, a total of 7 numbers.

# solve("1341") = 7. See test cases for more examples.

=begin
input: string of integers
output: integer

rules/questions
- return number of odd-numbered substrings formed
- odd-numbered substrings? continous

examples

data structures


# Algorithm
- initialize a result set to 0
- initialize a walker set to 0
- initilaize a loop
  - break if walker == str.length
  - initiliaze a runner and set to walker
  - initialize a nested loop
    - break if runner is == length of input string
    - slice a substring from walker..runner
    - increment result by 1 if substring to integer is odd
    - increment runner by 1
  - increment walker by 1
- return result

=end

def solve(str)
  result = 0
  walker = 0

  loop do
    break if walker == str.length 
    runner = walker
    
    loop do
      break if runner == str.length
      substr = str[walker..runner].to_i
      result += 1 if substr.odd?
      runner += 1
    end
    
    walker += 1
  end

  result

end

# For example, in the case of "1341", they are 1, 1, 3, 13, 41, 341, 1341, a total of 7 numbers.


p solve("1341") #== 7
p solve("1357") #== 10
p solve("13471") #== 12
p solve("134721") #== 13
p solve("1347231") #== 20
p solve("13472315") #== 28

## 30 min