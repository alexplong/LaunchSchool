
loop do
  input = nil

  loop do
    puts ">> How many output lines do you want? Enter a number >= 3: (Q to quit)"
    input = gets.chomp

    break if input == "Q" || input == "q" || input.to_i > 3
    puts ">> That's not enough lines"
  end

  break if input == "Q" || input == "q"

  input.to_i.times do
    puts "LaunchSchool is the best"
  end

  
end