def swapcase(input)

  lowercase = ("a".."z").to_a
  uppercase = ("A".."Z").to_a
  output_string = ""
  counter = 0

  loop do

    if lowercase.include?(input[counter])
      output_string << input[counter].upcase
    elsif uppercase.include?(input[counter])
      output_string << input[counter].downcase
    else
      output_string << input[counter]
    end

    counter += 1
    break if counter > input.length - 1
  end

  output_string
end

puts swapcase('CamelCase') == 'cAMELcASE'
puts swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'