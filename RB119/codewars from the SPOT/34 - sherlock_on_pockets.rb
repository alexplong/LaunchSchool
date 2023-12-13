=begin
Difficulty: medium

Sherlock has to find suspects on his latest case. He will use your method, dear 
Watson. Suspect in this case is a person which has something not allowed in 
his/her pockets.

Allowed items are defined by array of numbers.

Pockets contents are defined by map entries where key is a person and value is 
one or few things represented by an array of numbers (can be nil or empty array 
if empty), 
  
Example of pockets:
  
  pockets = { 
    bob: [1],
    tom: [2, 5],
    jane: [7]
  } 
  
Write a method which helps Sherlock to find suspects. If no suspect is found or 
there are no pockets (pockets == nil), the method should return nil.


input: a hash containing names (key) and items within their pocket (value - arr)
          - items can be nil, an empty array, or an array of integers
input: an array of allowed items (items are integers) or empty array
output: an array of keys or nil

RULES
- given a hash of suspects and their pockets and an array of allowed items
- persons are not suspects if their pockets are empty (nil or empty array)
- otherwise return a list of suspects in an array 
    - suspects are those that have contents in their pocket which is/are not allowed
- if there are no suspects, return nil

DATA STRUCTURE
-Hash: input
-Array: input

-Array: output

ALGORITHM - selection
- Given a hash and an array as input
- Iterate through the hash for selection
- if pocket is nil or an empty array
  - false
- Else
  - Check if the pocket of the suspect contains any items after removing the allowed ones
    - If true, they are suspects to select
- Get the keys from the selected hash
- Return nil if array of keys is empty 
- Else return those keys
=end

def find_suspects(pockets, items)
  suspects = pockets.select do |key, item|
    if item.nil? || item.empty?
      false
    else
      (item - items).any?
    end
  end.keys

  suspects.empty? ? nil : suspects
end

pockets = {}
p find_suspects(pockets, [1, 3]) == nil

pockets = { tom: [2], bob: [2], julia: [3], meg: [3] }
p find_suspects(pockets, [2, 3]) == nil

pockets = { julia: nil, meg: [] }
p find_suspects(pockets, [1, 6]) == nil

pockets = { meg: [3], tom: [5] }
p find_suspects(pockets, []) == [:meg, :tom]

pockets = { meg: [1, 3], tom: [5, 3] }
p find_suspects(pockets, [1, 3]) == [:tom]
