=begin
Difficulty: medium

In this kata, you've to count lowercase letters in a given string and return
the letter count in a hash with 'letter' as key and count as 'value'. The key 
must be 'symbol' instead of string in Ruby and 'char' instead of string in 
Crystal.

Example:

letterCount('arithmetics') #=> {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}

=end

=begin
input: a string
output: a hash

RULES
- given a string, count lowercase chars
- return a hash with char as key and count as value
  - key is symbol

Implicit:
- if counting only lowercase chars, input must be given only in lowercase chars

DATA STRUCTURE

ALGORITHM
- Given a string
- Create an array of unique chars from given string
- Iterate through each char in array to append to an empty hash for the result
  - Count number of curr char in given string
  - Store curr char as symbol for key and count as value in result hash
- Return result hash
=end

# Get uniq arr of chars and iterate to get count and store in hash

def letter_count(str)
  characters = str.chars.uniq

  characters.each_with_object({}) do |char, result|
    result[char.to_sym] = str.count(char)
  end

end


p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}

# iterate to count