=begin
Difficulty: medium

You will be given a number and you will need to return it as a string in 
Expanded Form. 

Examples

expanded_form(12); # Should return '10 + 2'
expanded_form(42); # Should return '40 + 2'
expanded_form(70304); # Should return '70000 + 300 + 4'

NOTE: All numbers will be whole numbers greater than 0.
=end

=begin
Input: an integer
Output: a string with integer expanded

RULES
- All numbers will be whole nums and > 0

EXAMPLE
12 > [2, 1] > ["2", "10"] > ["10", "2"] 

342 > [2, 4, 3] > ["2", "40", "300"]
index 0: 10 ** 0 * element = 2
index 1: 10 ** 1 * element = 40
index 2: 10 ** 2 * element = 300

DATA STRUCTURE

ALGORITHM
- Given an integer
- Split the integer into an array of digits
- Each digit in arr with index (w/ transformation > map)
  - (10 ** curr index) * curr digit
- Remove elements taht are 0 from Array
- Reverse the array
- Join reversed array with ' + ' 
- Return the returned string
=end

def expanded_form(int)
  int_digits = int.digits

  int_digits = int_digits.map.with_index do |digit, idx|
    ((10 ** idx) * digit)
  end
  
  int_digits.delete(0)

  int_digits.reverse.join(' + ')

end

p expanded_form(12) == '10 + 2'
p expanded_form(42) == '40 + 2'
p expanded_form(70304) == '70000 + 300 + 4'
