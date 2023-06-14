def calculate_bonus(salary, bonus)
    # if bonus then salary / 2 else 0 end
        
    # ternary version
    bonus ? (salary / 2) : 0
    
end


puts calculate_bonus(2800, true)
puts calculate_bonus(1000, false)
puts calculate_bonus(50000, true)
    
    
    