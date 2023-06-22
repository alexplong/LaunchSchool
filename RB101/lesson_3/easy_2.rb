# determine if "Spot" is present. Bonus: what are two other methods that work just as well for this solution?
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10, "Spot" => 1 }


p ages.key?("Spot")
p ages.has_key?("Spot")
p ages.include?("Spot")
p ages.member?("Spot")

# convert the following strings to following ways below
munsters_description = "The Munsters are creepy in a good way."

# "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
puts munsters_description.swapcase
# "The munsters are creepy in a good way."
puts munsters_description.capitalize
# "the munsters are creepy in a good way."
puts munsters_description.downcase
# "THE MUNSTERS ARE CREEPY IN A GOOD WAY."
puts munsters_description.upcase


# add additional munsters ages to the main hash
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
ages.merge!(additional_ages)
p ages


# see if dino appears in String below
advice = "Few things in life are as important as house training your pet dinosaur."
p advice.include?("dino") # LS answer used .match? but both give same output. What's diff?

# include?
# Returns true if self contains other_string, false otherwise:
# match?
# Returns true or false based on whether a match is found for self and pattern.

# show an easier way to write this
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
easy_flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones
p easy_flintstones

# how do we add "Dino" to the array?
# flintstones << "Dino"

# how about multiple items? "Dino" and "Hoppy"
flintstones.push("Dino", "Hoppy")
# or
flintstones.push("Dino").push("Hoppy")
p flintstones


# shorten the following sentence
advice = "Few things in life are as important as house training your pet dinosaur."
# use String#slice to make the return value as "Few things in life are as important as " and leave the rest in the variable

puts advice.slice!("Few things in life are as important as ")
puts advice


# write a one-liner to count the number of lower case 't' 
statement = "The Flintstones Rock!"
puts statement.count "t"



# how to center the following title above a table 40 characters in width
title = "Flintstone Family Members"
puts title.center(40)