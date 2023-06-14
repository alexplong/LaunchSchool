def reverse_numbers(number)

    # non loop version
    num_string = number.to_s.reverse
    num_string.to_i
    
end


puts reverse_numbers(123)
