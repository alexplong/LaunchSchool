def balanced?(string)

  tally = 0
  letters = string.chars
  letters.each do |letter|

    return false if tally < 0
    if letter == "("
      tally += 1
    elsif letter == ")"
      tally -= 1
    end
  end
  if tally == 0 
    true
  else
    false
  end
end

puts balanced?('What (is) this?') == true
puts balanced?('What is) this?') == false
puts balanced?('What (is this?') == false
puts balanced?('((What) (is this))?') == true
puts balanced?('((What)) (is this))?') == false
puts balanced?('Hey!') == true
puts balanced?(')Hey!(') == false
puts balanced?('What ((is))) up(') == false
puts balanced?('What ())(is() up') == false