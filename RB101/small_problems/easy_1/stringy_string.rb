# Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, 
# always starting with 1. The length of the string should match the given integer.

# examples
# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'

def stringy(n)
    
    output = ""
    
    n.times do |x|
        number = x.even? ? "1" : "0"
        output << number
        
        # modify below into a ternary statement instead
        # if x % 2 == 0
        #     output << "1"
        # else
        #     output << "0"
        # end
    end
    
    output
end

# puts stringy(6) 
# puts stringy(9) 
# puts stringy(4)
# puts stringy(24) 


def stringy_defaults(number, y = 1)
    output = ""
    
    number.times do |x|
        number = x.even? ? "1" : "0"
        if y == 0
            number = x.even? ? "0" : "1" 
        end
        output << number

    end
    
    output
end

puts stringy_defaults(4)
puts stringy_defaults(4, 0)
puts stringy_defaults(13)
puts stringy_defaults(13, 0)
