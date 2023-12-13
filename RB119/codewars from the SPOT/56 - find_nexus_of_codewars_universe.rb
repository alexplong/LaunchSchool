=begin
Difficulty: ___

Not to brag, but I recently became the nexus of the Codewars universe! My honor 
and my rank were the same number. I cried a little.

Complete the method that takes a hash/object/directory/association list of users, 
and find the nexus: the user whose rank is the closest is equal to his honor. Return 
the rank of this user. For each user, the key is the rank and the value is the honor.

If nobody has an exact rank/honor match, return the rank of the user who comes closest. 
If there are several users who come closest, return the one with the lowest rank 
(numeric value). The hash will not necessarily contain consecutive rank numbers; return 
the best match from the ranks provided.

Example

         rank    honor
users = {  1  =>  93,
          10  =>  55,
          15  =>  30,
          20  =>  19,    <--- nexus
          23  =>  11,
          30  =>   2 }

input: a hash
output: an integer

RULES
- Given a hash (list of users)
- Find nexus: user whose rank is the closest is equal to his honor
  - Therefore, return the rank of the user whose rank and honor are the same
  - If there are no users, with rank/honor like previous mentioned, return rank of user with smallest difference
    - If multiple users share the same rank-honor difference, return the user with the lowest rank

DATA STRUCTURES
- Hash: input
- Integer: output

ALGORITHM
- Given a hash containing rank as the key and honor as the value
- Create a variable curr_nexus and set to first key in hash
- Create a variable difference and set it to first key-value difference
- Iterate through the key-value pair in a hash
  - Find the absolute difference between the key and value
  - If curr difference is lower than local variable difference 
    - Update local var difference to value in curr difference
    - Update curr_nexus to be the current key 
  - If curr difference is equal to local variable difference AND key is lower than curr_nexus
    - Update curr_nexus to be the current key
- Return curr_nexus
=end

def nexus(hsh)
  # curr_nexus = hsh.first.first
  # diff = (hsh.first.first - hsh.first.last).abs

  # hsh.each do |key, value|
  #   curr_diff = (key - value).abs
  #   if curr_diff < diff
  #     diff = curr_diff
  #     curr_nexus = key
  #   elsif curr_diff == diff && key < curr_nexus
  #     curr_nexus = key 
  #   end
  # end
  # curr_nexus

  hsh.min_by do |key, value|
    (key-value).abs
  end.first
end


def nexus(hsh)
  
end

p nexus({1 => 3, 3 => 3, 5 => 1}) #== 3
p nexus({1 => 10, 2 => 6, 3 => 4, 5 => 1}) #== 3
p nexus({1 => 10, 2 => 3, 3 => 4, 5 => 1}) #== 2
