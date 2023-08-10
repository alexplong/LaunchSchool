=begin
Build a program that asks a user for the length and width of a room in meters and then displays the area of the room in both square meters and square feet.

Note: 1 square meter == 10.7639 square feet

Do not worry about validating the input at this time.

Example Run
# => Enter the length of the room in meters:
# => 10
# => Enter the width of the room in meters:
# => 7
# => The area of the room is 70.0 square meters (753.47 square feet).
=end


=begin
P_
  INPUT:  user input, length of room in meters
  OUTPUT: a Number

  RULES
  - do not worry about validating input
  - output floats in square meters and square feet

E_
Example Run
# => Enter the length of the room in meters:
# => 10
# => Enter the width of the room in meters:
# => 7
# => The area of the room is 70.0 square meters (753.47 square feet).

D_
    

A_
    - prompt user for length in meters, ask user for input, convert to float and store input in variable
    - prompt user for width in meters, ask user for input, convert to float and store input in variable
    - calculate length and width in feet
    - calculate square meter area and square feet area of room
    - output interpolated string with float values

=end

def calculate_room_size
  puts "Enter the length of the room in meters:"
  room_length = gets.to_f
  puts "Enter the width of the room in meters:"
  room_width = gets.to_f
  area_meters = room_length * room_width
  ft_length = room_length * 3.28084
  ft_width = room_width * 3.28084
  area_ft = (ft_length * ft_width).round(2)
  puts "The area of the room is #{area_meters} square meters (#{area_ft} square feet)."

end

calculate_room_size