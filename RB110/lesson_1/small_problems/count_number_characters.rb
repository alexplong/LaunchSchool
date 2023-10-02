def count_number_of_chars
  puts "Please write word or multiple words: "
  input = gets.chomp
  puts "There are #{input.delete(' ').length} characters in \"#{input}\""
end

count_number_of_chars