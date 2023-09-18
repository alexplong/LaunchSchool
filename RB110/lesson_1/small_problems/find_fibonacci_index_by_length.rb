def find_fibonacci_index_by_length(length, memo={})

  fib_1 = 1
  fib_2 = 1
  sequence = 2
  digits = 1

  while digits < length

    next_fib = fib_1 + fib_2
    fib_1 = fib_2
    fib_2 = next_fib
    sequence += 1
    digits = fib_2.to_s.length

  end
    
  sequence
end


puts find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
puts find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
puts find_fibonacci_index_by_length(10) == 45
puts find_fibonacci_index_by_length(100) == 476
puts find_fibonacci_index_by_length(1000) == 4782
puts find_fibonacci_index_by_length(10000) == 47847



# def find_fibonacci(n, memo={})
#   return memo[n] if memo.has_key?(n)
#   return 1 if n <= 2
#   memo[n] = find_fibonacci(n - 1, memo) + find_fibonacci(n - 2, memo)
#   memo[n]
# end



