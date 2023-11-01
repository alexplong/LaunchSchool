=begin
Sherlock has to find suspects on his latest case. He will use your method, dear Watson. Suspect in this case is a person which has something not allowed in his/her pockets.

Allowed items are defined by array of numbers.

Pockets contents are defined by a hash where key is a person and value is one or few things represented by an array of numbers (can be nil or empty array if empty).

Write a method which helps Sherlock to find suspects. If no suspect is found or there are no pockets (`pockets == nil`), the method should return nil.
=end

=begin
Input: hash, and an array of integers
  - Hash:
    - Key are symbols of names of people
    - Values are items in their pockets, represented by integers
  - Array of integers representing allowed items
Output: array of symbols representing the suspects
  - nil if no suspects are found

Problems
- Iterate through each person
- Compare the contents of the persons pockets with what is allowed to identify the suspects
- Return an array of suspects or nil

Data
- { tom: [2], bob: [2], julia: [3], meg: [3] }
  - [2], [2], [3], [3] <> [2, 3] looking items that are not in the list
  - 2's and 3' are in [2, 3]
- { meg: [1, 3], tom: [5, 3] }
  - [1, 3], [5, 3] <> [1, 3]
  - meg: (not a suspect as 1, 3 are in allowed)
  - tom: suspect because 5 is not in the allowed

Algorithm
- Empty suspect array
- Iterate through all the elements of the input hash
  - Compare the contents of the pocket with the allowed array (using .all with block)
    - if the pocket is nil or empty, continue
    - If the pocket contains something NOT in the allowed array
      - Add the symbol of the person to a suspect array
- If the suspect array is empty
  - Return nil
- Return suspect array

=end

# def find_suspects(pockets, allowed_items)
#   suspects = []
#   pockets.each do |name, pocket|
#     next if (pocket == nil) || (pocket.empty?)
#     suspects << name if !pocket.all? { |item| allowed_items.include?(item) }
#   end
#   return nil if suspects.empty?
#   suspects
# end

def find_suspects(pockets, allowed_items)
  # suspects = []
  suspects = pockets.select do |name, pocket|
    next if (pocket == nil) || (pocket.empty?)
    !pocket.all? { |item| allowed_items.include?(item) }
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

def pairs(arr)
  arr.uniq.sum { |num| arr.count(num) / 2 }
end

p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0