def yell(string)
  string += '!'
  string.upcase!
end

test_string = "hello there"
yell(test_string)
puts test_string

# What does this code output on line 9? Why? What is the underlying concept being demonstrated? 
# What happens if we change the `#+` method to a `#<<` method instead? What does this now demonstrate?









def foo(b)
  b.select do |letter|
    puts "This is #{letter}" if letter == 'c' 
  end
  b << 'd'
end

a = ['a', 'b', 'c']
p foo(a)
# What does this code output on line 9? Why? What happens if we move code from line 5 above the `#select` invocation instead? What changed?
favorite = "cats"
x = ''
3.times do |_|
  x = favorite.upcase!
end

if x
  puts "true cats"
else
  puts "false cats"
end
# What does this code output? Why? What can be changed to change the output from this code example?








