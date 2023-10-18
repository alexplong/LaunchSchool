def fibonacci(n)

  return 1 if n <= 2
  
  first_value = 1
  second_value = 1
  counter = 2
  
  until counter >= n
    next_num = first_value + second_value
    first_value = second_value
    second_value = next_num
    counter += 1
  end
  
  second_value
end

# refactored
def fibonacci(n)

  first, second = [1, 1]

  3.upto(n) do
    first, second = [second, first + second]
  end
  second
end

puts fibonacci(20) == 6765
puts fibonacci(100) == 354224848179261915075
puts fibonacci(100_001) # => 4202692702.....8285979669707537501


