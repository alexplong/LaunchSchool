def fizzbuzz(a, b)
  sequence_collection = (a..b).to_a
  puts (sequence_collection.map do |number|
    if (number % 3 == 0) && (number % 5 == 0)
      "FizzBuzz"
    elsif number % 3 == 0
      "Fizz"
    elsif number % 5 == 0
      "Buzz"
    else
      number
    end
  end).join(", ")
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz