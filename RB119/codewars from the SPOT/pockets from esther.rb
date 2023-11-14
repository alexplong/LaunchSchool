
=begin
Input: a hash (pockets) and an Array of Integers (allowed items)
Output: an Array of Symbols (keys from hash) or nil

RULES
Explicit:
- Return suspects in an Array if suspect has items not allowed
- Allowed items: array of integers
- Pocket is a hash, person is a key and items (array of Integers, empty Array or nil) is value associated with key
- 
Implicit:
-

MENTAL MODEL
- If pocket has no elements return nil
- If everyones pocket is nil or empty return nil
- Check if items of each person are included in allowed items list
  - If not, add person to suspects array

DATA STRUCTURE
- 1 Hash: input
- 1 Array: input
- 1 Array: output

ALGORITHM
- Initialize an ouput variable and set to empty array
- Given a Hash and an Array as input
#- Return nil if hash is empty or if all values are nil or empty (check irb)
- Get an Array of all keys from pocket hash
- Use aray of keys to iterate through hash
  - Get array from correspnding key in hash
  - next if curr pocket is a nil or if its an empty array
  - Check if all (any) values in this array are NOT included in input Array is in allolwed?
  - If true, add key (suspect) to output array
- Return output array if not empty otherwise return nil
=end

def find_suspects(pockets, allowed)
  
  # return nil if pockets.any? 

  # output = []

  suspects = pockets.reject do |person, items|
    next if items == nil
    (items - allowed).empty?
  end
  
  suspects.empty? ? nil : suspects.keys

  # pocket_keys = pockets.keys

  # pocket_keys.each do |curr_key|
  #   curr_pocket = pockets[curr_key]
  #   next if curr_pocket.nil? || curr_pocket.empty?
  #   output << curr_key if !curr_pocket.all? { |curr_item| allowed.include?(curr_item)}
  # end

  # output.empty? ? nil : output

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

## 27 min
## try to convey more confidence by saying out loud before writing
## limit writing and talking, talk first then write it down 
