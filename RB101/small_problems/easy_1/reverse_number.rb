def reverse_numbers(number)

  # # non loop version
  # num_string = number.to_s.reverse
  # num_string.to_i
  
  # loop version - no strings
  int_reverse = []

  loop do
    int_reverse << number % 10
    number = number / 10
    break if number <= 0
  end

  limit = int_reverse.length - 1

  reversed = 0

  int_reverse.each_with_index do |n, index|
    reversed += n * (10 ** (limit - index))
  end
  reversed
end


puts reverse_numbers(54321)
