=begin
Difficulty: ___

Write a function toWeirdCase (weirdcase in Ruby) that accepts a string, and returns 
the same string with all even indexed characters in each word upper cased, and all 
odd indexed characters in each word lower cased. The indexing just explained is zero 
based, so the zero-ith index is even, therefore that character should be upper cased.

The passed in string will only consist of alphabetical characters and spaces(' '). 
Spaces will only be present if there are multiple words. Words will be separated by 
a single space(' ').

=end

def weirdcase(str)
  words = str.scan(/[a-z]+/i)

  words.map do |word|
    word.chars.map.with_index do |char, i|
      if i.even?
        char.upcase
      else
        char.downcase
      end
    end.join
  end.join(' ')
end

p weirdcase( "String" ) == "StRiNg"
p weirdcase( "Weird string case" ) == "WeIrD StRiNg CaSe"


