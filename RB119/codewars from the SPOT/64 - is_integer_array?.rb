=begin
Difficulty: ___

Write a function with the signature shown below:

def is_int_array(arr)
  true
end

returns true / True if every element in an array is an integer or a float with no decimals.
returns true / True if array is empty.
returns false / False for every other input.

=end

=begin

RULES
- return false if object is not an array
- return false if input is not a number
=end


def is_int_array(obj)
  return false if obj.class != Array

  obj.each do |n|
    return false if n.nil? || n.to_i != n
  end

  true
end


p is_int_array([]) == true # "Input: []"
p is_int_array([1, 2, 3, 4]) == true # "Input: [1, 2, 3, 4]"
p is_int_array([-11, -12, -13, -14]) == true # "Input: [-11, -12, -13, -14]"
p is_int_array([1.0, 2.0, 3.0]) == true # "Input: [1.0, 2.0, 3.0]"
p is_int_array([1, 2, nil]) == false # "Input: [1,2, nil]"
p is_int_array(nil) == false # "Input: nil"
p is_int_array("") == false # "Input: ''"
p is_int_array([nil]) == false # "Input: [nil]"
p is_int_array([1.0, 2.0, 3.0001]) == false # "Input: [1.0, 2.0, 3.0001]"
p is_int_array(["-1"]) == false # "Input: ['-1']"
