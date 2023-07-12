
a = "I want to be lowercase"
array = [1, 2, 3, 4, 5]
p(array.select do |num|           # p method 
	puts num if num.odd?
	a.upcase!
end)

# What is returned? nil returned by select call
# What is output?   # => [1, 3, 5] from invoking select # => 
# What is the value of a after the code is executed? 

# (I adapted this problem from 'code block 3' in the first set of problems posted to this channel, 
# after playing around with it in my code editor. I hope people find this kind of slightly devious 
# problem useful... They definitely help me get into the weeds and understand some of the more 
# obscure aspects of methods from RB101)



# p method invocation passing in expression in as an argument

# in argument > select method is called on by array and code block within do..end statement is passed
# in as the argument to select. select method will evaluate and return a new array containing elements 
# that evaluates to true within the code block. in the code block, each iteration will print a number
# if it is odd, and then a destructive call on the a string with upcase! is the implicit return in this
# call and is 'truthy' 