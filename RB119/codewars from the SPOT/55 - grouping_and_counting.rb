=begin
Difficulty: ___

Your goal is to write the group_and_count method, which should receive an array as 
a unique parameter and return a hash. Empty or nil input must return nil instead of
a hash. This hash returned must contain as keys the unique values of the array, and 
as values the counting of each value.

Example usage:

input = [1,1,2,2,2,3]

group_and_count(input)# == {1=>2, 2=>3, 3=>1}

The following methods were disabled:
- Array#count
- Array#length

=end


=begin
Input: an array, or empty array, or nil
Output: a hash or nil

RULES
Explicit:
- Take in an array as input
- Return a hash which unique values as keys (keep key as its current Class object)
  - Count of each value as value for associated key
- Do not use Array#count or Array#length
- If Array input is empty or if nil is passed in we will return nil

Implicit:
- Expect elements to only be Integers

DATA STRUCTURES
-

MENTAL MODEL
- Single pass iteration over the Array
- Check if curr element is in the Hash to be output
  - Increment by 1 if current element is already in the Hash
  - Otherwise make curr element a key in hash and set its value to 1
- Return the hash

ALGORITHM
- If input Array is empty or if input is nil, return nil
- Initialize a result variable as output and set to an empty Hash
- Given an Array as input
- Iterate through each number in numbers
  - Check if current number is output hash
  - If true, increment value associated with key in the hash that matches current number by 1
  - Otherwise, add current number as a key in hash and set its value to 1
- Return hash
=end

def group_and_count(numbers)
  return nil if numbers.nil? || numbers.empty?

  result = {}

  numbers.each do |number|
    if result[number]
      result[number] += 1
    else
      result[number] = 1
    end
  end
  
  result
end


p group_and_count([1,1,2,2,2,3]) == {1=>2, 2=>3, 3=>1}
p group_and_count([]) == nil
p group_and_count(nil) == nil
p group_and_count([1, 7, 5, -1]) == {1=>1, 7=>1, 5=>1, -1=>1}
