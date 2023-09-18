def leading_substrings(characters)
  array_of_characters = characters.split('')
  array_of_characters.each_with_object([]).with_index do |(char, accumulator), index|
    if index == 0 then accumulator << char else accumulator << array_of_characters.slice(0, index + 1).join end
  end
end

def substrings(characters)
  substrings_output = []
  counter = 0
  loop do
    substrings_output.concat(leading_substrings(characters.slice(counter, characters.length)))
    counter += 1
    break if counter == characters.length
  end
  substrings_output
end

def palindromes(string)

  all_substrings = substrings(string)
  all_substrings.each_with_object([]) do |word, collection|
    next if word.length < 2
    collection << word if word == word.reverse
  end
end


p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
puts palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
puts palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]