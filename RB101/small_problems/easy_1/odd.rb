def is_odd?(number)
    number = number.abs
    # single line of a simple true/false if/else statement
    number % 2 == 0
    # number.remainder(2) == 0 # can use modulo or remainder but keep in mind when working with negative #'s'
    
end

puts is_odd?(3)
puts is_odd?(-16)
puts is_odd?(9)