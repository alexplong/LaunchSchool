=begin
## Difficulty: hard

Given a string containing brackets [], braces {}, parentheses (), or any combination thereof, verify that any and all pairs are matched and nested correctly.

=end


p paired?('[]]') == false
p paired?(']][[') == false
p paired?('{}{}[()]') == true
p paired?('{}{}[()') == false
p paired?('[({]})') == false
p paired?('\left(\begin{array}{cc} \frac{1}{3} & x\ ' +
'\mathrm{e}^{x} &... x^2 \end{array}\right)') == true
p paired?('(((185 + 223.85) * 15) - 543)/2') == true
