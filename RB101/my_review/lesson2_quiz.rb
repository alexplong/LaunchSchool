# what is this an example of?
MyModule
## CamelCase

# identify the proper Ruby comment < - see this line

# identify correct code examples of correct Ruby syntax
response = Kernel.gets().chomp()
response = Kernel.gets.chomp
response = gets.chomp
response = gets().chomp()

# identify the error in the following code 
a = 2
b = rand(2)
a *= b

if a = 2
  puts 'Two'
else
  puts 'Not Two'
end
# it will always return 'Two' because:
# a variable assignment a=2 was used in a conditional evaluation if statement
# and assignments are 'truthy' so 'Two' will always be printed output


# what is pseudocode
## human readable high level description of a program or algorithm that can be used
## to help formulate a solution to a given problem
## it helps to understand the underlying problem and figure that out
## then try to figure out the syntax code
## if you try to figure out both, it can lead to headaches


# what can be put in place of omitted so the code outputs 'Goodbye'
## ones that output true && has slightly higher precedence than ||
omitted_code = num > 5 && num < 10  # true
omitted_code = num < 4 || num == 8 && num > 6 # num < 4 || true # => true
omitted_code = num < 7 || num > 7 # true
omitted_code = num >= 8 && num < 6 || num > 4 # false || num > 4 # => true

num = 8
if num >= 8 && num < 6 || num > 4
  puts 'Goodbye'
end


# what can be put in place of omitted so the code outputs 'Hello'
## ones that output true && has slightly higher precedence than ||
omitted_code = num / 3 > 3 && num < 10 # true && false # => false
omitted_code = num < 4 || num > 8 && num < 10 || num > 16 # num < 4 || false || num > 16 # => false
omitted_code = num % 4 == 0 || num < 7 && num < 10 # num % 4 == 0 || false # => true
omitted_code = num >= 8 && num < 6 || num > 4 && num < 16 # false || true # => true

num = 12
if #omitted code
  puts 'Hello'
end



# which code implementation closely matches the pseudo-code
# Given a sentence made up of several words, write a method to do the following.

# Iterate through the words one by one.
#   - save the first word as the starting value.
#   - starting with the next word iterate through all the remaining words in the sentence
#   - for each iteration, compare the saved value with the current word.
#   - if the word is longer or the same length as the saved value:
#     - reassign the saved value as the current word
#   - move on to the next word

# After iterating through the sentence, return the saved value.
## this is the one 
def longest_word(sentence)
  words = sentence.split
  saved_word = words.shift

  words.each do |word|
    if word.length >= saved_word.length
      saved_word = word
    end
  end

  saved_word
end


# In Ruby, what do we mean when we say that an expression evaluates to a truthy value? Choose all the answers that apply.
# all values other than nil and false in a condition will evaluate to true
# it doesn't mean 'truthy' == true however


# find the error in the code below
user_input = gets

## do/end code blocks called by the loop method has its own local scope
## the name variable initalized inside the do/end block here does not 
## have access to it from the puts call outside the loop block
## can resolve by initalizing the variable outside the do/end loop block
## do/end does have access to variables outside but accessible does not 
## work in the switched position
name = ''
loop do
  name = user_input
  break
end

if user_input
  puts "Hello " + name
end


# why does the last line in the code output 'hi'
## method extend_greeting is invoked and greeting is passed as argument
## the method returns the string passed that's been concatenated >> its concatenating the return call
## it does not modify the greeting variable, the variable that gets passed in
## answer; the String#+ method does not mutate the caller
def extend_greeting(greeting)
  greeting << " there"
end

greeting = "hi"
extend_greeting(greeting)

puts greeting


# how could you change the method above so that greeting outputs "hi there"
## instead of + which does not mutate the caller, we can instead use << 
## since local variable inside the method greeting also points to the same String object
## that String object is mutated 


# what are the Ruby behaviors when passing an object as an argument in a method call.
## variables are references to objects and don't contain objects themselves
## when object is passed to method as an argument, the method parameter acts as a variable referencing that object

## reassigning a variable has no effect on the object the variable is bound to, it merely binds the variable to a different object
## if object passed as argument is mutable, and operation defined in method definition is one that mutates its caller
## the original object can be mutated



# what is meant when said variables as pointers?
## it means references act as labels to physical space memory


# why is the name method invoked instead of the variable?
## because name method is first? JK
## display_name method does not have access to the variable name
## therefore it'll call the method
def name
  "George"
end

name = "Lisa"

def display_name
  puts name
end
display_name

# how can we change above so "Lisa" is printed?
## can pass name as an argument to display_name method



# why does it invoke the local variable instead of the method?
## loop method has access to outer scope variables and variable is above method
## however outside scope does not have access to loop variables in the code block do/end
name = "Lisa"

def name
  "George"
end

loop do
  puts name
  break
end
