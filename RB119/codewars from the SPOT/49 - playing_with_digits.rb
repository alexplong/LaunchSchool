=begin
Difficulty: ___

Some numbers have funny properties. For example:

89 --> 8¹ + 9² = 89 * 1

695 --> 6² + 9³ + 5⁴= 1390 = 695 * 2

46288 --> 4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷ = 2360688 = 46288 * 51

Given a positive integer n written as abcd... (a, b, c, d... being digits) and a positive integer p

We want to find a positive integer k, if it exists, such as the sum of the digits of n 
taken to the successive powers of p is equal to k * n.

In other words:

  Is there an integer k such as : (a ^ p + b ^ (p+1) + c ^(p+2) + d ^ (p+3) + ...) = n * k

  If it is the case we will return k, if not return -1.

Note: n and p will always be given as strictly positive integers.

Examples: 
  dig_pow(89, 1) should return 1 since 8¹ + 9² = 89 = 89 * 1
  dig_pow(92, 1) should return -1 since there is no k such as 9¹ + 2² equals 92 * k
  dig_pow(695, 2) should return 2 since 6² + 9³ + 5⁴= 1390 = 695 * 2
  dig_pow(46288, 3) should return 51 since 4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷ = 2360688 = 46288 * 51

input: two integers: n (broken to digits) and p
output: an integer: k

RULES
- Given a positive integer n and a positive integer p
  - n will be written as abcd where a, b, c, and d are digits
- Find a positive integer k, if it exists, otherewise return -1
  - k is: (a ^ p + b ^ (p+1) + c ^(p+2) + d ^ (p+3) + ...) = n * k
  - refactor to find k: k = (a ^ p + b ^ (p+1) + c ^(p+2) + d ^ (p+3) + ...) / n

ALGORITHM
- Given a pair of integers: n which will be broken into digits and p
- Transform n into an array of digits and reverse it to keep orientation
- Create a variable sum and set it to 0
- Iterate through digits array
  - Get new value of digit where each digit is taken to successive powers of p
  - Increment sum by previous value
  - Increment p by 1
- Check if modular division of sum by n returns no remainders
  - If true return the division of sum by n 
- Else return -1
=end

def dig_pow(n, p)
  arr_sum = n.digits.reverse.each_with_object(0).with_index do |(num, arr_sum) idx|
              arr_sum += num ** (p + idx)
            end

  arr_sum % n == 0 ? arr_sum / n : -1

end


p dig_pow(89, 1) == 1
p dig_pow(92, 1) == -1
p dig_pow(46288, 3) == 51
p dig_pow(695, 2) == 2
