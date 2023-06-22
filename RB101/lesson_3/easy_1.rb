
# what do you expect the following to output?

numbers = [1, 2, 2, 4]
numbers.uniq

puts numbers.inspect # numbers should not be mutated since .uniq returns a new array
# p numbers is puts numbers.inspect # the p automatically calls inspect on its argument


# explain the difference between ! and ? in Ruby
# the ! and ? operator can typically be found appended to methods that mutate the Object invoking the method or a method that returns a boolean value
# however, this is because they're just part of the method name and naming convention, 
# the ! operator can also be found prepended to the = operator resulting in a 'not equal to' operator
# the ! operator can also be prepended to true/'truthy' and false/'falsey' to switch them to the boolean opposite
# the !! operator can also be prepended to 'truthy' and 'falsey' objects? things? which returns true or false respectively
# the ? operator can be found appended to methods that returns a boolean value
# the ? : operators can be found in ternary statements for if/else conditions


# explain the following scenarios
# 1. what is != and where should you use it ## means not equal and when setting conditionals
# 2. put ! before something, like !username ## if username is 'truthy' it will return the opposite boolean value so false
# 3. put ! after something, like words.uniq! ## in this case, for the method definition, it means its going to mutate the object that invoked it
# 4. put ? before something ## putting a ? before an Integer or a Char returns a Char however, anything else (String, variable, etc) returns error
# 5. put ? after something ## its a syntax error as its expecting a value and a : for ternary statement
# 6. put !! before something, like !!username ## because username is likely to be 'truthy' it'll return the boolean value so true


# replace important with urgent in this string
advice = "Few things in life are as important as house training your pet dinosaur."
advice.sub!('important', 'urgent') #sub replaced first occurrence while gsub replaces all occurrences, also can use regex /important/
puts advice


# Ruby Array class has several methods for removing items from an array. Two have similar names, lets see how they differ.
numbers = [1, 2, 3, 4, 5]
# what do the following methods ouput (assume numbers is reset after each method call)
# deletes index 1 # [1, 3, 4, 5]
numbers.delete_at(1)
p numbers

numbers = [1, 2, 3, 4, 5]
# deletes first occurrence maybe of the value 1 from the array # [2, 3, 4, 5]
numbers.delete(1)
p numbers


# Programmatically determine if 42 likes between 10 and 100. Use Ruby's range object
x = 10..100
puts (10..100).include?(42) # => true ## LS used cover?
# from documentation, if begin and end are numeric, include? behaves like cover?


# Show two different pays to put the expected "Four score and " in front of the string
famous_words = "seven years ago..."
# famous_words.insert(0, 'Four score and ') # method 1 works
# famous_words.prepend('Four score and ') # method 2 works
# puts famous_words
puts "Four score and " << famous_words


# building the following array results in a nested array
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

# turn this into an unnested array
flintstones.flatten!
p flintstones


# given the following hash, create an array containing only two elements: Barney's name and Barney's number
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
# p flintstones
# barney_arr = flintstones.select { |k,v| k == "Barney"}.flatten
# use assoc instead, if key found, returns 2 element array containing key and value
barney_arr = flintstones.assoc("Barney")
p barney_arr