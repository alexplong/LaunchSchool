# clearly explain, talk about, or demonstrate the following topics

# numbers: integers and floats
# strings
# interpolation in strings
# boolean vs. truthiness
# nil
# array and hash syntax
# array properties and methods: Array#size, Array#push, Array#pop
# operators
# numeric operators: +, -, *, /, %, divmod, **
# string operators: +, *
# conditional operators: ==, !=, <, >, <=, >=, ternary
# logical operators and short-circuit evaluation: !, &&, ||
# operator precedence


################################################################
# literals ###
"Hello"       # string literal
824           # integer literal
3.14          # float literal
true          # boolean literal
[1, 2, 3]     # array literal
{a: 1, b: 2}  # hash literal
:sym          # symbol literal
nil           # nil literal


################################################################
# Strings ### - a list of characters in a specific sequence
single_quotes = 'often work with data like names, messages, etc and strings can represent such data'
double_quotes = "string literals can be represented with single or double quotes"
single_quote_w_backslashes = 'we can use \'backslashes\' to escape for single quotes to insert within one'
set_of_numbers = [1, 2, 3] # an array

# string interpolation with double quotes and useful way to merge Ruby code with Strings
puts interpolated_string = "double quotes allow for string interpolation-- we interpolate these numbers: #{set_of_numbers}"

x = 'Kobe Bryant is a forever Laker'
x.length      # => 29
x.center(40)  # => "     Kobe Bryant is a forever Laker      " // centers it between 40 chars
x.gsub("Laker", "Los Angeles Laker") # => "Kobe Bryant is a forever Los Angeles Laker" // replace text
x.count("KB") # => 2 // returns total # of characters in string by given selector
x.upcase      # => "KOBE BRYANT IS A FOREVER LAKER"
x.downcase    # => "kobe bryant is a forever laker"
x.split(' ')  # => ["Kobe", "Brant", "is", "a", "forever", "Laker"]

# String Objects are mutable - while some built-in String methods returns a new_string
# some methods (including methods with a ! suffix) can mutate the original String Object


################################################################
# Boolean Values ### - true and false values in most programming languages
true    # true
false   # false
!true   # false
!false  # true
'Hi'    # is a 'truthy' value
!'Hi'   # false
!!'Hi'  # true
if 'Hi' puts "Hello" end # => "Hi" // 'Hi' is 'truthy'


################################################################
# Numbers ### - represesented many ways in Ruby
    # Integer is the most basic form of a number - represented by the whole number only with no decimal point
    # Float is the more complex form of a number and contains a decimal point
1, 2, 3, 50, 100, 4245082890  # example of integer literals
1.2345, 2345.12343, 98.1341   # example of float literals
1.integer?    # => true
1.0.integer?  # => false
"24".to_int   # => 24


################################################################
# symbols ### - created with a : before a word -- they don't have to be valid variable names
    # if the symbol name is enclosed in quotes
:name
:a_symbol
:"also a symbol with spaces"

    # when are they useful? or to be used?
    # whenever you want to reference something like a string but don't ever intend to print
    # it to the screen or change it
    # often referred to as immutable string however it's not 100% technically correct


################################################################
# nil ### - a way to express "nothing" in Ruby
    # a variable with a value of nil could be described as having 'nothing' or being 'completely empty',
    # or even just 'not any specific type'
puts "Hello, World!"  # => outputs "Hello, World!" but returns nil
                      # the above prints out a string and returns nothing
x = nil               # nil value can be explicitly defined to a variable
"Hello, World".nil?   # can check if something is nil using nil?
if nil then puts "Hello, World" end # in conditionals, nil acts 'falsey' and will be treated as false
nil == false                        # => false; while 'falsey' it is not equivalent to false


################################################################
# arrays ### - an ordered list of elements that can be of any type
my_array = [1, 'Alex', 8.24, 'Lakers', ['another', 'array']]    # arrays can have anything in them
my_array.size       # => 5  // returns number of elements in array 
my_array.push(8)    # => [1, "Alex", 8.24, "Lakers", ["another", "array"], 8] // returns self & mutates call
my_array.pop        # => ['another', 'array'] // returns popped element & mutates self
                    # // both push and pop mutates the caller
my_array << 'Kobe'  # shovel operater << also mutates caller and returns self
# mutating the caller vs mutating arguments distinction
my_array.pop                # an example of mutating the caller > my_array is used to call the pop method
modify_this_array(my_array) # here would be an example of mutating an argument because the array is passed into the method call as an argument
def mutate(arr)             # a little more complicated distinction but important
  arr.pop                   # pop mutates its caller arr, which in turn mutates argument passed to mutate method
end
def not_mutate(arr)
  arr.select { |i| i > 3 }  # arr.select does not mutate its caller so not_mutate method doesnt mutate its argument either
end
# common methods to use
[1, 2, 3, 4].each { |n| puts n }      # => returns original array at end of iteration
                                      # => also method for element and index parameters in the code block
[1, 2, 3, 4].each_with_index { |n, i| puts "#{n}; #{i}" }   # => also returns original array
[1, 2, 3, 4].map { |n| n**n }         # => [1, 4, 27, 256] // iterates over array and returns new array
                                      # so map returns new array because returned value from code block
                                      # are the new elements in the mapped array
[1, 2, 3, 4].collect { |n| n**n }     # => [1, 4, 27, 256] // collect is an alias to .map method
[1, 2, 4, 5].select { |n| n % 2 == 0} # => [2, 4] // returns new array containing elements that 
                                      # returned true to the expression provided
[1, 2, 3, 4].delete_at(1)             # => mutates call and returns deleted element at desired index position
[1, 1, 2, 2, 4].uniq                  # => [1, 2, 4]  // returns new array of only unique elements, also a ! version
my_array.include?('Kobe')             # => true       // returns a bool and checks if arg is element in given array
my_array.flatten                      # [1, "Alex", 8.24, "Lakers", "another", "array", 8, "Kobe"] // returns new one-dimensional array
                                      # also a ! version of flatten!
[1, 4, 2, 3].sort                     # => [1, 2, 3, 4] // returns new array containing sorted elements
[1, 4, 2, 3].sort { |a,b| a <=> b }   # => [1, 2, 3, 4] // with code block returns new array similar to no code block
[1, 4, 2, 3].sort { |a,b| b <=> a }   # => [4, 3, 2, 1] // returns new array with elements sorted in reverse
[1, 2, 3].product([4, 5])             # => [[1, 4], [1, 5], [2, 4], [2, 5], [3, 4], [3, 5]] // returns a combination of all elements


################################################################
# hash ### - a data structure that stores items by associated keys and entries often referred to ask key-value pairs
old_syntax_hash = { :name => 'Alex' }
person = { name: 'Alex', height: '6 ft'}    # new syntax introduced in Ruby 1.9
person[:age] = 37                           # => 37   // returns value 
person[:age]                                # => 37   // retrieve data
person.each { |key, value| puts "Alex's #{key} is #{value}"}  # can iterate similarly to each method for Arrays
greeting("Alex", {age: 37, city: "Tampa" }) # => hashes can be used as optional parameters in a method
greeting("Alex", age: 37, city: "Tampa")    # => when hashes are last arg in a method, can omit { }
{ "height" => "6 ft" }                      # hash keys are diverse, strings can be keys but need to use =>
{ [height] => " 6 ft"}                      # array as key
{ {key: "key"} => "that hash is a key"}     # even a hash can be a key
# common hash methods
person.key?(:name)                          # => true // returns a bool
person.select { |k,v| (k == :name || v == 'Alex')}
person.fetch(:name)                         # => "Alex"
person.fetch(:job, "Job is not found here") # "Job is not found here" // without second arg, would be KeyError
                                            # second arg provided to stop error when not found
person.to_a                                 # => [[:name, "Alex"], [:age, 37]] // returns new array 
person.keys                                 # => [:name, :age]    // returns all keys
person.values                               # => ["Alex", 37]     // returns all values


################################################################
# operations ### 
# numeric operators -- adding, subtracting, and multiplying integers
# math operations in Ruby are simple and can be written like normal equations
1 + 1           # => 2  add
1 - 1           # => 0  subtract
2 * 4           # => 8  multiply
16 / 3          # => 5  division
4 ** 2          # => 16 exponents
# division vs modulo
16 % 3          # => 1 # can be referred to as the remainder operator but not 100% correct
16 / 4.0        # => 4.0 # division by float results in float answer
# modulo vs remainder
16 % 5          # -> 1
16.remainder(5) # => 1 // #remainder computes and returns remainder of an integer division operation
16.divmod(5)    # => [3, 1] // #divmod computes both integer and result of division and its modulo value
                # modulo returns positive when second operand is positive
                # modulo returns negative when second operand is negative
                # remainder returns positive when first operand is positive
                # remainder returns negative when first operand is negative
# multiplying and divising floats - Ruby always returns a float when using one in an operation, 
# despite one of the numbers being an integer
15.0 / 4        # => 3.75
9.75 * 4.32     # => 42.120000000000005


################################################################
# string operators ### - string concatenation looks a lot like addition using the + operator to join two strings
'foo' + 'foo'   # => "foofoo"   // + operator returns new string
'foo' + 'bar'   # > "foobar"
'1' + '1'       # => "11"       // as opposed to numeric + operation
'one' + 1       # => TypeError  // unable to perform implicit conversion of Integer to String
'one' + 1.to_s  # => "one1"     // explicit conversion so it is able to perform concatenation 
# multiplying strings by a number returns new String containing input # of copies of itself
'Yo ' * 3       # => "yo yo yo "


################################################################
# conditional operators ### - compares and checks condition between two objects and returns a boolean
4 == 4         # => true    // the == "equal to" operator
2 == 5         # => false          
'foo' == 'foo' # => true
'4' == 4       # => false
'4' != 4       # => true    // the != "not equal to" operator
4 != 4         # => false
4 > 5          # => false   // the > "greater than" operator
4 < 5          # => true    // the < "lesser than" operator
'42' < '402'   # => false   // string comparison is char by char so different than numbers
4 >= 5         # => false   // the >= "greather than or equal to" operator
4 <= 5         # => true    // the <= "less than or equal to" operator


################################################################
# ternary operator ### - short and concise conditional if/else statements [3 arguments]
true ? "this is true" : "this is false"   # => "this is true"
false ? "this is true" : "this is false"  # => "this is false"
# ideally used to select between two values, not to choose between two actions
foo = hitchhiker ? 42 : 3.1415            # good - assigns result of ?: to a variable
puts(hitchhiker ? 42 : 3.1415)            # good - result from ternary (a value) passed as argument to puts method
return hitchhiker ? 42 : 3.1415           # good - return result
# don't do the following - bad practice
hitchhiker ? (foo = 42) : (bar = 3.1415)  # bad - setting variables
hitchhiker ? puts(42) : puts(3.1415)      # bad - printing


################################################################
# logical operators and short-circuit evaluation ### - the && 'and' operator and the || 'or' operator
(4 == 4) && (5 == 5)  # => true   // both sides of && operator to be true to return true
                      #           // short-circuit evaluation is when Ruby does not look 
                      #           // at both sides of the expression unless it has to
(4 == 5) && (5 == 5)  # => false  // since left is already false, no need to evaluate the other side of && operator
(4 == 4) || (5 == 5)  # => true   // only one side needs to evaluate to true to return true
(4 == 5) || (5 == 5)  # => true   // left side evaluates to false so right side of || checked and returns true
(4 == 4) || (4 == 7)  # => true   // right side is not evaluated at all due to short-circuit as left true returns true
# important use with non bools    // the && and || operators also work with 'truthy' and 'falsey' values and can return these values instead of bools
3 || 'foo'            # => 3      // the return value is ALWAYS the value of the operand evaluated last, since 3 'truthy' and last evaluated > return 3
'foo' || 3            # => "foo"  // "foo" is truthy > return "foo"
nil || 'foo'          # => "foo"
nil && 'foo'          # => nil    // since && operator and short-circuiting - nil is last operand to be evaluated
3 && 'foo'            # => "foo"  // && operator - "foo" last evaluated
'foo' && 3            # => 3
foo = nil             # another interesting expression 
bar = 'qux'
is_ok = foo || bar                    # => 'qux'  // last evaluated operand is bar and 'qux' can be used as a 'truthy' value but it's not the best practice
is_ok = (foo || bar) ? true : false   # a better way using ternary, if 'truthy' or 'falsey' > can set it to actual bool values 
is_ok = !!(foo || bar)                # => true // another way is using the following !! which acts as two consecutive ! operators: 
                                      # 'qux' is "truthy" so !'qux' # => false // then !false # => true is how we output true

################################################################
# operator precedence ### - set of rules that dictates how Ruby determines what operands each operator takes
3 + 5 * 7     # => 38 // * has higher precedence than + so * gets passed 5 and 7 as operands
              # // 3 and 35 then get passed to + for a final result of 38. 
              # // its best to use parenthesis to prioritize expresiosn rather than relying on precedence
3 + 5 - 9     # => -1 // operators of the same precedence, operations occur from left to right
# short-ciruit operators or ternary operators can lead to unexpected results when thinking of precedence
# evaluation process is more complicated than just precedence and other parts include left-to-right, right-to-left, short-circuitting, and ternary expressions
def value(n)
  puts n
  n
end
puts value(3) + value(5) * value(7)   # // + and * operators need values to work with and method invocations like
# => 3                                # // value(5) and value(7) are not values. Once those expressions are evaluated
# => 5                                # // does those values deal with precedence and can evaluate the expression
# => 7
# => 38
3 ? 1 / 0 : 1 + 2                     # raises error ZeroDivisionError, can alter so 1/0 isn't needed
nil ? 1 / 0 : 1 + 2                   # error statement still there but just isn't executed even though
                                      # precedence expects the / to precede the + operation but it doesn't due to short-circuiting
# precedence of { } vs do...end blocks > consider the following
array = [1, 2, 3]
array.map { |num| num + 1}            # => [2, 3, 4]
p array.map { |num| num + 1 }         # outputs [2, 3, 4] # => [2, 3, 4] // returned element from map is passed to p as an arg
array.map do |num|                    # => [2, 3, 4]
  num + 1
end
p array.map do |num|                  # => <Enumerator:: [1, 2, 3]:map> // it prints the map method
  num + 1                             # blocks have the weakest precedence of all operators but between two
end                                   # { } has slightly higher precedence than do...end
p (array.map do |num|                 # wrapping the whole thing in parenthesis fixes the precedence issue
  num + 1
end)


################################################################
# type conversion ### 
nil.to_i                          # => 0
'12'.to_i                         # => 12
'4 hi there'.to_i                 # => 4  appended strings don't affect number at beginning
'hi there 4'.to_i                 # => 0  strings prepending number leads to 0
nil.to_f                          # => 0.0  
'4'.to_f                          # => 4.0
'4 hi there'.to_f                 # => 4.0  similar things happening with float
'hi there 4'.to_f                 # => 0.0
nil.to_s                          # => "" empty to string is empty string
false.to_s                        # => "false"
{name: "Alex", age: 37}.to_s      # => "{:name=>\"Alex\", :age=>37}"
{name: "Alex", age: 37}.to_a      # => [[:name, "Alex"], [:age, 37]]
[["Alex", 37], ["Umi", 35]].to_h  # => {"Alex"=>37, "Umi"=>35}


################################################################
# mutability, immutability, and constants ### 
# Integers and Floats are immutable - instead of mutating original object, a new Float is created and is bound to the new object
x = 1                         # 
x.object_id                   # => 3
x += 1                        #
x.object_id                   # => 5
                          # strings, arrays, hashes are mutable
mutable = 'it me'             # variable is pointer to the String object
was_it_mutated = mutable      # create reference to same pointer
mutable << ', see!'           # => "it me, see!" 
puts was_it_mutated           # => "it me, see!"  // object_id's match
array_mutable = [1, 2, 3]     # variable is pointer to Array object, with each element pointing to
array_mutable.object_id       # an immutable Integer object
array_mutable[0].object_id
array_mutable[1].object_id
array_mutable[2].object_id
array_mutable.push(4)         # original object_id still 
                          # mutability similar with hash
arr_string = ['alex', 'umi']  # example with strings and follows up with section below
arr_string[0].object_id       # object_id of position 0 pointer to String object
arr_string[0] = 'umishiba'    # array []= assignment leads to mutation of String object, 
                          # still points to same object_id
x = 'hello'                   # reassignment does not mean mutation of variable
x += ' there'                 # => "hello there"           // object_id shows new String object created and is now bound to x
x = x + '!!!'                 # => "hello there!!!"        // again object_id shows new String object made and bound to x
x = 'hello there!!!'          # => "hello there!!!"        // new String object with same value bound to x
                              # as opposed to shovel operator << that does mutate
x << ' smelllo'               # => "hello there!!! smello" // now the operator has mutated the caller
                              # constants - declared with all caps. Ruby allows mutation of constants but you should NOT
MAMBA = 824                   # have lexical scope, behave like globals 
def from_methods              # can be accessed within blocks ex not shown cause all vars do that
  puts "printing #{MAMBA}"    # can be accessed via methods without having to pass them in
end
loop do
  MY_TEAM = "The Lakers"      # declaration in inner scope also leaves it accessible in outer scope
  break
end
puts MY_TEAM


################################################################
# variables ### - local variables, constant names, initialization of variables, and reassignment
i_am_a_variable = "Alex"      # snake case for local variables, methods, or file
NEW_CONSTANT = "new constant" # capitalize constant variables
class MyFirstClass            # pascal case for classes
                              # initialization of variable - where it's created detetrmines scope 
                              # with respect to inner and outer scope for accessibility
                              # assignment of variable performed using assignment operator =, reassignment also performed with = operator
i_am_a_variable = "Plong"     # reassignment points the variable to a new String object rather than mutate the original object

################################################################
# variable scope and method definitions ### 
# a variable's scope is determined by where the variable is initialized or created
# in Ruby, variable scope is defined by a method definition or a block
name = 'Somebody else'                      # lets look at variable scope and method definitons 
def print_full_name(first_name, last_name)  # methods have self-contained scope & only variables initialized within method body can be referenced or modified by the method
  name = first_name + ' ' + last_name       # variable's intialized inside a method's body aren't available outside of it and same vice-versa, method has no access to outside scoped variables
  puts name                                 # another name variable is created that is locally scoped to the method
end                                         # thus, the method is unable to mutate the outside scoped name variable inside the print_full_name method
print_full_name 'Alex', 'Plong'             # => "Alex Plong"
puts name                                   # => "Somebody Else"


################################################################
# variable scope and blocks ### - blocks are code that follow method invocation 
# Ruby creates a new scope for local variables and block behavior is identical for blocks with one-line { } as well as multi-line do...end
total = 0                                   # total is outer scoped and is accessible in { } block invoked by each method
[1, 2, 3].each { |n| total += n}            # outer scope can be accessed by inner scope but not vice versa
puts total                                  # => 6  // outer scoped variable altered inside the { } code block
                                            # the example show Ruby blocks creates a new scope for local variables (the inner scope)
# not all do...end keyword/syntax imply a block that alters scoping!
# for and while loops are NOT blocks
arr = [1, 2, 3]
for i in arr do   # NOT a block
  a = 5           # NOT a different scoped variable
end
puts a            # => 5 // a is accessible
                  # if all else, if { } or do...end does not immediately follow a method invocation, it's NOT a block

                                            
################################################################
# variable shadowing ### - inner scope can access outer scope in blocks but ...
# if the block local variable (or block parameter) shares same name as outside scoped variable
# variable shadowing functions to prevent access to the outer scoped variable when the naming scheme previously mentioned occurs
# if you refer to the outside scope variable without it having the same variable name as the block parameter
# you'll access the outside scope variable, as you should since blocks allow acc
x = 10
5.times do |x|  # // block parameter shares same name as outside scoped variable
  puts x        # => 0, # => 1, # => 2, # => 3, # => 4 
end             # // despite blocks having access to outside scope variables, variable shadowing prevented access since block parameter name is the same
puts x          # => 10


################################################################
# variables as pointers ### - Ruby variables act as pointers to an address space in memory
# variable does not actually contain the value but instead contains a pointer to specific area in memory that contains the value
a = 'hi there'      # a contains pointer to String object
b = a               # b now contains pointer to same address
a = 'not here'      # a is reassigned to point to new String object
                    # => a outputs "not here", # => b outputs "hi there"
                    # some operations mutate the address space (<< operator, []= operator, destructive/mutating methods including ! and others)
                    # other operations (=, +=, -=, *=, etc) and non-destructive/non-mutating methods make variable point to a different address


################################################################
# conditionals ### - conditionals is a fork (or many forks) in the road - data approaches a conditional and the conditional
# directs data where to go based on defined parameters
# formed using a combination of if statements and comparison and logical operators (<, >, <=, >=, ==, !=, &&, ||)
# they are basic logical structures that are defined with the reserved words if, else, elsif, and end
a = 2
if a == 2
  puts 'a is 2'
elsif a == 4
  puts 'a is 4'
else
  puts 'a is neither 2 or 4'
end
is_this_true = true
foo = is_this_true ? "yes it is" : "no it is not"       # ternary operator makes quick if/else statements on one line
puts foo                                                # keep in mind to only use ternary to select between two values and not choose between two actions
is_this_true ? puts("yes it is") : puts("no it is not") # bad use example
# case statement - similar functionality to an if statement but with slightly different interface
a = 4
case a                                                  # can also be stored into a variable, line can be rewritten as: answer = case a
when 2                                                  # structure very similar to if/else statement
  puts "a is 2"
when 4
  puts "a is 4"
else
  puts "a is neither 2 or 4"
end                                                     # => "a is 4"   // if rewritten, can remove puts from body and add puts answer to end 
# comparisons using equal to (==) operator, not equal to (!=) operator, and the <, >, <=, >= operators always returns a boolean
4 == 5                                                  # => false
(4 == 4) && (5 == 5)                                    # => true // can be combined to create more specific scenarios using && and || operators 
                                                        # when operating on booleans
                                                        # operators: && and || will return true or false but NOT always the case
                                                        # see SHORT-CIRCUITING SECTION above for more
(4 == 5) || (5 == 5)                                    # => true // don't forget about short-circuiting and precedence when it comes to evaluation order
# order of precedence is followed by Ruby when deciding how to evaluate multiple expressions
# highest order of precedence (top) to lowest (bottom)
# <=, <, >, >=      # => Comparison
# ==, !=            # => Equality
# &&                # => Logical AND
# ||                # => Logical OR


################################################################
# loops and iterators ### - a loop is the repetitive execution of code for a given amount of repititions or until a certain condition is met
# loop method
loop do                   # simplest loop to create in Ruby is with the loop method
  puts "I'm looping"      # this loop executes any code within the block ({ } or do...end) and continues to execute until
#  break                  # you can manually stop the loop with Ctrl + c or insert a break statement inside the block to exit the loop
end                       # otherwise without the break, it will loop forever

# loop with break keyword
i = 0                     # can also use conditionals to break out of loop
loop do                   # here we are implementing break into the loop
  i = i + 1               # code blocks following loop method invocation introduces new scope and inner scope can access outside scope but not vice versa
  puts i                  
  if i == 10              # break out of the loop when i == 10          
    break
  end
end

# loop with next keyword
j = 0                     # next is used to skip the rest of the current iteration and start the next iteration
loop do
  j = j + 1
  if j % 2 != 0
    next                  # skip over the rest of this iteration
  end
  puts j
  if j == 10
    break                 # break out of loop after condition is met
  end
end

# while loops - given a parameter that evaluates as a boolean: true or false
x = 0
while x < 10              # while true >> when expression becomes to false => loop is not executed again => program continues after while loop
  puts x                  # while is NOT a method, I repeat, while is NOT a method
  x += 1                  # no method invocation, means no code block => which means NEW SCOPE NOT CREATED
  b = "see not a scope"   # => not in an inner scope
end                       # therefore, the entire body of the loop is in the same scope as the code that contains the while loop
puts "while loop done"
puts b                    # => "see not a scope"

# until loops - this loop is simply the opposite of the while loop
x = 10                    # until can be substituted for keyword while in order to phrase the problem in a different way
until x < 0               # while statement is false, continue loop UNTIL true
  puts x                  #   similar to while loops, until is not a method => therefore no new scope created
  x -= 1                  #
end                       #
puts "until loop done"    #

# do/while loops - works similar to while loop with one important difference => code within gets executed one time prior to conditional check
                          # in do/while loops, the conditional check is at the end of the loop as opposed to the beginning
loop do                   # do/while loops in Ruby doesn't use while keyword, just incorporates do and break to function like so
  puts "want to do that again?"
  answer = gets.chomp
  abc = 'yo'              # the do/whle loop uses the loop method => method invocation with do...end code block => new scope created here
  if answer != "Y"        # conditional at the end of the do/while loop
    break
  end
end

# for loops - used to loop over a collection of elements, has a definite end to loop unlike while loops (infinite)
x = 10
for i in 1..x do          # using ranges: 1..10 => 1 thru 10 inclusive  // 1...10 => 1 up to 10 but not 10
  puts x - i
end
puts "done"

x = [1, 2, 3, 4, 5]       # using arrays
for i in x.reverse do     # new scope NOT CREATED in for loop, similar to while loop
  puts i
end           
puts "done"

# using conditionals within loops - 
# the reserved words: next and break, as well as other methods can add conditional flow control within loops to alter their behavior


# recursion ### - another way to create a loop in Ruby and is the act of calling a method from within itself
def doubler(start)
  puts start
  if start < 10
    doubler(start * 2)
  end
end

def fibonacci(number)                         # example with fib sequence
  if number < 2                               # baseline condition that returns a value => starts to "unwind" the recursive calls
    number
  else
    fibonacci(number - 1) + fibonacci(n - 2)  # other condition where it calls itself
  end
end


################################################################
# iterators ### - they are methods that naturally loop over a given set of data
# each iterator method - one method we've been commonly using
names = ['Alex', 'Umi', 'Nuzzles', 'Lil Bit', 'Miss Business']    
x = 1                           # lets iterate over the array and print a counter with the names
names.each do |name|            # each method is called using dot operator do/end block with block parameter => new scope created from each method invocation
  puts "#{x}. #{name}"          # print counter and name as method iterates through the array
  x += 1                        # we add one to the counter since do/end block can access outside scoped variable
end                             # => []'Alex', 'Umi', 'Nuzzles', 'Lil Bit', 'Miss Business']  // each returns original array

# times iterator method - a super compact for loop 
# 24.times { puts 'KOBE!'}      # one-line version
24.times do                     # as a compact for loop, properties of for loops still apply
  puts 'KOBE!'                  # no new scope created using the times iterator
  b = 8                         # variable is in same scope as rest of program
end                             
puts b                          # => 8


################################################################
# puts method ### - puts is short for put string and is used to print a string followed by a newline character