require "pry"
a = "John"
b = "Doe"
puts "#{a} #{b}"

n = 4321
puts "thousands #{n / 1000}"
puts "hundreds #{n % 1000 / 100}"
puts "tens #{n % 100 / 10}"
puts "ones #{n % 10}"

movies = {:Friday => 2003, :Next_Friday => 2006, :Friday_After_Next => 2010}

def print_movies(list)
  list.each { |movie,year| puts year }
end

print_movies(movies)

movies_years = movies.collect {|movie, year| year}
puts movies_years.is_a? Array

def print_squares(n)
  puts n * n
end

print_squares(2)
print_squares(24)
print_squares(8)