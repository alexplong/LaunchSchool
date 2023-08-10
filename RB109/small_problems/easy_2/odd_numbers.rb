=begin
Print all odd numbers from 1 to 99, inclusive, to the console, with each number on a separate line.
=end

=begin
P_

E_

D_

A_
  - initialize a variable to 1
  - initialize a loop
      - if outer scope variable is odd puts that number
      - break out of loop after variable > 99
=end


value = 1

while value <= 99
  puts value if value.odd?
  value += 1
end
