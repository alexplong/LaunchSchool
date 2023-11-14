=begin
You will be given an array of string `"east"` formatted differently every time. Write a method that returns `"west"` wherever there is `"east"`. Format the string according to the input.

The input will only be `"east"` in different formats.
=end

p direction(["east", "EAST", "eastEAST"]) == ["west", "WEST", "westWEST"]
p direction(["eAsT EaSt", "EaSt eAsT"]) == ["wEsT WeSt", "WeSt wEsT"]
p direction(["east EAST", "e a s t", "E A S T"]) == ["west WEST", "w e s t", "W E S T"]