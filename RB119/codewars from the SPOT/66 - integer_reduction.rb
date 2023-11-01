=begin
Difficulty: ___

In this Kata, you will be given two integers n and k and your task is to 
remove k-digits from n and return the lowest number possible, without changing
the order of the digits in n. Return the result as a string.

Let's take an example of solve(123056,4). We need to remove 4 digits from 123056 
and return the lowest possible number. The best digits to remove are (1,2,3,6) 
so that the remaining digits are '05'. Therefore, solve(123056,4) = '05'.

Note 

The order of the numbers in n does not change: solve(1284569,2) = '12456', 
because we have removed 8 and 9.

=end

p solve(123056,1) =='12056'
p solve(123056,2) =='1056'
p solve(123056,3) =='056'
p solve(123056,4) =='05'
p solve(1284569,1) =='124569'
p solve(1284569,2) =='12456'
p solve(1284569,3) =='1245'
p solve(1284569,4) =='124'