=begin
Difficulty: medium

You live in the city of Cartesia where all roads are laid out in a perfect grid. 
You arrived ten minutes too early to an appointment, so you decided to take the 
opportunity to go for a short walk. The city provides its citizens with a Walk 
Generating App on their phones -- everytime you press the button it sends you an 
array of one-letter strings representing directions to walk 
(eg. ['n', 's', 'w', 'e']). You always walk only a single block in a direction 
and you know it takes you one minute to traverse one city block, so create a 
function that will return true if the walk the app gives you will take you 
exactly ten minutes (you don't want to be early or late!) and will, of course, 
return you to your starting point. Return false otherwise.

Note: you will always receive a valid array containing a random assortment of 
direction letters ('n', 's', 'e', or 'w' only). It will never give you an empty 
array (that's not a walk, that's standing still!).

input: an array of chars
output: a Boolean

RULES
- Given an array of chars that represent directions
- Return true if after traversing the directions provided, you return to the same location
  - Else return false
- You walk only a single block in a direction and it takes 1 min

[0, 0] N/S will increment/decrement value at index pos. 0
       E/W will increment/decrement value at index pos. 1

DATA STRUCTURE
- Array: input
- Array: 2-element coordinates to use to determine boolean selection

ALGORITHM
- Given an array of directions 
- If length of directions is greater than 10 return false
- Create a variable called coordinates and set it to [0, 0] ([a, b])
- Iterate through the array to determine the current direction
  - If curr direction is N: increment a by 1
  - If curr direction is S: decrement a by 1
  - If curr direction is E: increment b by 1
  - If curr direction is W: decrement b by 1
- Return true if coordiantes are equal to [0, 0]
  - else return false

=end

def is_valid_walk(arr)
  return false if arr.size > 10
  coordinates = [0, 0]

  arr.each do |dir|
    case dir
    when 'n' then coordinates[0] += 1
    when 's' then coordinates[0] -= 1
    when 'e' then coordinates[1] += 1
    when 'w' then coordinates[1] -= 1
    end
  end

  coordinates == [0, 0]
  # count of n == count of s && count of e == count of w
end

p is_valid_walk(['n','s','n','s','n','s','n','s','n','s']) == true
p is_valid_walk(['w','e','w','e','w','e','w','e','w','e','w','e']) == false
p is_valid_walk(['w']) == false
p is_valid_walk(['n','n','n','s','n','s','n','s','n','s']) == false
