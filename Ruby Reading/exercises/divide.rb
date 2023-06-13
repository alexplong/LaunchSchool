def divide(number, divisor)
  begin
    answer = number / divisor
  rescue ZeroDivisionError => e # rescuing ZeroDivisionError and storing it in variable e
    puts e.message  # we then have access to the message method the ZeroDivisionError object has
  end
end

puts divide(16, 4)
puts divide(4, 0)
puts divide(14, 7)