car = {
  type: "sedan",
  color: "blue",
  mileage: 80_000,
  year: 2003
}

# car[:year] = 2003

car.delete(:mileage)
# puts car[:color]


numbers = {
  high:   100,
  medium: 50,
  low:    10
}

# numbers.each do |k, v|
#   puts "A #{k} number is #{v}"
# end

half_numbers = numbers.map { |k, v| v / 2 } # map on a hash actually returns an array!
# p half_numbers

low_numbers = numbers.select { |k, v| v < 25 }
# p low_numbers

numbers = {
  high:   100,
  medium: 50,
  low:    10
}

low_numbers = numbers.select! do |key, value| # mutating the original hash using destructive ! leads to both vars leading to the same hash *think pointers
                 value < 25
               end

p low_numbers
p numbers

cars = {
  car: {type: "sedan", color: "blue", year: 2003},
  truck: {type: "pickup", color: "red", year: 1998}
}

car = {
  type:  'sedan',
  color: 'blue',
  year:  2003
}

car = [[:type, "sedan"], [:color, "blue"], [:year, 2003]]