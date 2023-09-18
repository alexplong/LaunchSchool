def word_to_digit(input)
  
  numbers_reference = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

  numbers_reference.each_with_index do |word, number|
    input.gsub!(/\b#{word}\b/, number.to_s)
  end
input
end



puts word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
