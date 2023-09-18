
def staggered_case(input)

  staggered_output = ""
  set_caps = true
  counter = 0
  
  loop do
    uppercase = input[counter].upcase
    lowercase = input[counter].downcase
    letter_converted = set_caps ? uppercase : lowercase

    if input[counter] =~ /[A-Za-z]/
      staggered_output << letter_converted
      set_caps = !set_caps
    else
      staggered_output << input[counter]
    end

    counter += 1
    break if counter == input.length 
  end

  staggered_output

end

puts staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
puts staggered_case('ALL CAPS') == 'AlL cApS'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'