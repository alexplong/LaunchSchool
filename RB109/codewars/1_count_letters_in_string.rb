=begin
Count letters in string
In this kata, you've to count lowercase letters in a given string and return the letter count in a hash with 'letter' as key and count as 'value'. The key must be 'symbol' instead of string in Ruby and 'char' instead of string in Crystal.

Example:

letterCount('arithmetics') #=> {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}
=end

=begin
P_
  INPUT: a string
  OUTPUT: letters and their respective counts in the string

  RULES:
  - lowercase letters
  - letter as key and count as value
  - key must be symbol
  - output is sorted # NIXED doesn't need to be sorted HASHES aren't sorted

E_
letterCount('arithmetics') #=> {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}
('yo')  # => {:o=>1, :y=>1}
('yee') # => {:e=>2, :y=>1}

D_
  OUTPUT: sorted Hash with symbols as keys

A_
  1. initialize a new empty hash
  2. for every char in string
      1. check if char is in hash
          1. if no, create symbol key in hash with value of 1
          2. if yes, update count by 1
  3. return sorted hash

C_
=end

def letter_count(str)
  counted = {}
  str.each_char do |char|
    char = char.to_sym
    if counted.has_key?(char)
      counted[char] += 1
    else
      counted[char] = 1
    end
  end
  counted
end


p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}

=begin
On line 40, the letter_count method is defined with a single parameter str. When invoked, the string object passed in as the argument is bound to str and now referenced by it. On line 41, the empty hash is initialized to the outer scope. On the following line, the each_char method is called on str and gets passed the do...end block with the block parameter char being the variable for every character in the string per iteration. The char next gets converted to a symbol and then a conditional check to see if the key char is in the output hash. If not in the output hash, we initialize a new key with char and set it equal to 1. If it is in the output hash, we increase the value by 1. Finally we do an implicit return on the output hash, counted.

=end
