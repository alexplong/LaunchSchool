# predict the output
a = "forty two"
b = "forty two"
c = a

# a == c, but b will have a different id
# puts a.object_id
# puts b.object_id
# puts c.object_id


# predict the next output
a = 42
b = 42
c = a

# a still == c, but b will have a different id
# Integers are immutable but I think c will still point to the same object_id
# OHHHHHH Integers are indeed immutable but they have their own object_id already set
# in Ruby, each integer is a single immutable object, there can only be one integer 1 object and so on
# it turns out a, b, and c have the same immutable 42 object at object_id 85 here
puts a.object_id
puts b.object_id
puts c.object_id


# state what will be displayed and why
# def tricky_method(string_param_one, string_param_two)
#   string_param_one += "rutabaga"
#   string_param_two << "rutabaga"
# end

# string_arg_one = "pumpkins"
# string_arg_two = "pumpkins"
# tricky_method(string_arg_one, string_arg_two) # both instances here, they are pass by value

# puts "String_arg_one looks like this now: #{string_arg_one}" # should output pumpkins because += is a non-mutable operator
# puts "String_arg_two looks like this now: #{string_arg_two}" # should output pumpkinsrutabaga because << is a mutable operator


# compared to prev. this one will modify the string but not the array
# the method variable gets reassigned to a new object so the original object isn't modified
# recall in Ruby when we reassign, it doesn't mutate, it points to a new object
def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"


# change code so it's easier to predict and maintain
# resulting method should not mutate either argument
# but should still output the new without modifying the old

def tricky_method(a_string_param, an_array_param)
  a_string_param << "rutabaga"
  an_array_param << "rutabaga"
end

def not_so_tricky_method(string_param, array_param)
  string_param += "rutabaga"
  array_param = array_param.push("rutabaga")
  return string_param, array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
# tricky_method(my_string, my_array)
my_string, my_array = not_so_tricky_method(my_string, my_array) # returns both into both variables
puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"


# simplify without changing its return value
# def color_valid(color)
#   if color == "blue" || color == "green"
#     true
#   else
#     false
#   end
# end


def color_valid(color)
  color == "blue" || color == "green"
end

puts color_valid('blue')
puts color_valid('green')
puts color_valid('yellow')