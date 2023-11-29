=begin
Difficulty: ___

Given two arrays a and b write a function comp(a, b) that checks whether the two 
arrays have the "same" elements, with the same multiplicities. "Same" means, here, 
that the elements in b are the elements in a squared, regardless of the order.

Examples

- Valid arrays

a = [121, 144, 19, 161, 19, 144, 19, 11]  
b = [121, 14641, 20736, 361, 25921, 361, 20736, 361]
comp(a, b) returns true because in b 121 is the square of 11, 14641 is the square of 121, 20736 the square of 144, 361 the square of 19, 25921 the square of 161, and so on. It gets obvious if we write b's elements in terms of squares:

a = [121, 144, 19, 161, 19, 144, 19, 11] 
b = [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]

- Invalid arrays

If we change the first number to something else, comp may not return true anymore:

a = [121, 144, 19, 161, 19, 144, 19, 11]  
b = [132, 14641, 20736, 361, 25921, 361, 20736, 361]
comp(a,b) returns false because in b 132 is not the square of any number of a.

a = [121, 144, 19, 161, 19, 144, 19, 11]  
b = [121, 14641, 20736, 36100, 25921, 361, 20736, 361]
comp(a,b) returns false because in b 36100 is not the square of any number of a.

- Remarks

a or b might be [] (all languages except R, Shell).
a or b might be nil or null or None or nothing (except in Haskell, Elixir, C++, Rust, R, Shell, PureScript).
If a or b are nil (or null or None), the problem doesn't make sense so return false.

input: two arrays a and b
output: a Boolean

RULES
- Given two arrays
  - Invalid inputs: 
    - if a or b are nil return false
    - if a or b are empty arrays return false
- Check whether the two arrays have the "same" elements
  - "same" means that the elements in b are the elements a * a from array a
  - order does not matter
  - Return true if the two arrays are teh "same" else return false
Implicit:
  - if sizes of input arrays are not the same return false
  - elements may be repeated

DATA STRUCTURE

ALGORITHM
- Given two arrays a and b as input
- return false if a or b are nil or if a or b are empty arrays or if size of a and b are different
- Iterate through array a
  - Check if array b contains curr element from a squared
  - If not, return false early
  - Otherwise 
    - find the index of that element
    - replace that element in array b with empty string by using the index
- true
=end

def comp(a, b)
  return false if a.nil? || b.nil? || a.empty? || b.empty? || a.size != b.size

  # a.each do |curr_a|
  #   b_index = b.index(curr_a ** 2)
  #   if b_index
  #     b[b_index] = ""
  #   else
  #     return false
  #   end
  # end
  # true

  (a.map { |n| n**2} - b).size == 0 ? true : false


end

p comp([121, 144, 19, 161, 19, 144, 19, 11], [121, 14641, 20736, 361, 25921, 361, 20736, 361]) == true
p comp([121, 144, 19, 161, 19, 144, 19, 11] , [132, 14641, 20736, 361, 25921, 361, 20736, 361]) == false
p comp(nil, [1, 2, 3]) == false
p comp([1, 2], []) == false
p comp([1, 2], [1, 4, 4]) == false
