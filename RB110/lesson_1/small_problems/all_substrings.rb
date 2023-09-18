
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

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]