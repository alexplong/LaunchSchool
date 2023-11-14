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

=end

def find_suspects(pockets, allowed)
  
end

pockets = {}
p find_suspects(pockets, [1, 3]) #== nil

pockets = { tom: [2], bob: [2], julia: [3], meg: [3] }
p find_suspects(pockets, [2, 3]) #== nil

pockets = { julia: nil, meg: [] }
p find_suspects(pockets, [1, 6]) #== nil

pockets = { meg: [3], tom: [5] }
p find_suspects(pockets, []) #== [:meg, :tom]

pockets = { meg: [1, 3], tom: [5, 3] }
p find_suspects(pockets, [1, 3]) #== [:tom]

