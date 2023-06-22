# write a one-line program that creates the following output 10 times with the subsequent line indented 1 space to the right
# 10.times { |i| puts ((" " * i) + "The Flintstones Rock!")}


# why did the following statement result in an error? what are two possible ways to fix it?
# puts "the value of 40 + 2 is " + (40 + 2) # i think it wants to do string interpolation but it can't because of the operation 40 + 2
# yes, it needs implicit conversion of Integer into String (TypeError)
# (40 + 2) is an Integer and it is being concatenated onto a String
puts "the value of 40 + 2 is " + (40 + 2).to_s # method 1
puts "the value of 40 + 2 is #{40 + 2}." # method 2


# how would you rewrite this so it doesn't go into an infinite loop?
def factors(number)
  divisor = number
  factors = []

  # begin
  #   break if divisor <= 0 # added a break condition if the divisor is 0 or negative
  #   factors << number / divisor if number % divisor == 0
  #   divisor -= 1
  # end until divisor == 0 # changed to divisor < 1 but it seems to break ahead of hitting the end

  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end

  factors
end

p factors(10)

# what is the purpse of number % divisor == 0?
## if condition is true, divisor is a factor of the number and leaves 0 remainder

# what is the purpose of the second-to-last line (line 8) in the method (the factors before the method's end)?
## as the last line in the method, the factors array gets returned from the method


# what is the difference between the two versions below using << and +  for modifying the buffer
def rolling_buffer1(buffer, max_buffer_size, new_element) 
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end
# the method above takes in a buffer object as arg and mutates that buffer object 
# since it mutates the original object, the next method call will see a modified array
# this means this method returns something and has a side effect

def rolling_buffer2(input_array, max_buffer_size, new_element) 
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end
# the method above in an object but returns a new object that can be stored in a variable
# this solution is the better solution because it doesn't have the side effect like 1 does


# what's wrong with this code?
# since limit is scoped outside of the method definition, the method has no scope access to any local variable outside of its scope
limit = 15

def fib(first_num, second_num, limit) # add it as an argument to pass the variable to the method
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"


# what's the output?
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8 # should be 42 - 8 = 34


# will the original object be affected by the method?
# yes, because munsters is a mutable object and its referenced is passed
# when passed into the method, the method variable demo_hash has a copy to the munsters object
# when modified, the original is also modified
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

mess_with_demographics(munsters)
p munsters


# this method returns the winning selection. what does the call return?
def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock") # paper


# what is the return value following method invocation?
def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

puts bar(foo)