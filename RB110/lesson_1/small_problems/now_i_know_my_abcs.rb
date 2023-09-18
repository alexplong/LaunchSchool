def block_word?(word)

  block_one = ['b', 'x', 'd', 'c', 'n', 'g', 'r', 'f', 'j', 'h', 'v', 'l', 'z']
  block_two = ['o', 'k', 'q', 'p', 'a', 't', 'e', 's', 'w', 'u', 'i', 'y', 'm']

  letters = word.chars
  block_index = (letters.map do |char| 
    if block_one.include?(char.downcase) 
      block_one.index(char.downcase)
    elsif block_two.include?(char.downcase)
      block_two.index(char.downcase)
    else
      nil
    end
  end)

  return false if block_index.include?(nil)
  if block_index.uniq.length == letters.length then true else false end
end
  
p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true