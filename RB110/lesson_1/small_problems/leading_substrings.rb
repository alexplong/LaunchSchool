def leading_substrings(characters)

  array_of_characters = characters.split('')
  array_of_characters.each_with_object([]).with_index do |(char, accumulator), index|
    if index == 0 then accumulator << char else accumulator << array_of_characters.slice(0, index + 1).join end
  end
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']