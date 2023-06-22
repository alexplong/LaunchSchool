# what do you expect to happen?
if false
  greeting = "hello world"
end

greeting # I expected an error because the variable was initialized in in the if statement
# however the output was nil because of the if condition, even when the condition in the if clause
# doesn't get executed, because of this the variable is nil vs an ExceptionError


# what is the result of the last line of the code?
greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there' # if we modify this from << to += instead, it would not modify the original hash


# the hash only holds references to the elements inside the hash therefore
# the hash at index 0 has a pointer to the element at key :a
# when informal greeting is assigned the element at key :a it also obtains the same pointer
# so when informal_greeting is modified, the element within the hash is also modified
# << is also a mutagenic operation
puts informal_greeting  #  => "hi there"
puts greetings 


# what will be printed by these code groups?
def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three) 
# pass by value, original variables should not be modified
# = reassignment operator

# puts "one is: #{one}"
# puts "two is: #{two}"
# puts "three is: #{three}"

def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)
# same as before

# puts "one is: #{one}"
# puts "two is: #{two}"
# puts "three is: #{three}"

def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"


# fix the following code
# its not returning false condition and not handling case that there are more or fewer than 4 components to the ip address
# 4.5.5 or 1.2.3.4.5 should be invalid

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".") # array of numbers
  return false if (dot_separated_words.size != 4)
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return true
end