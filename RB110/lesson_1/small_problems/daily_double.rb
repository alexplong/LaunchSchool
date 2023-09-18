def crunch(input)
  compressed_string = ""
  current_letter = ""
  index = 0

  while index <= input.length - 1
    compressed_string << input[index] unless input[index] == current_letter
    current_letter = input[index]
    index += 1
  end
  
  compressed_string
end

p crunch('ddaaiillyy ddoouubbllee ') == 'daily double '
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''