def double_consonants(word)

  consonants = %w(b c d f g h j k l m n p q r s t v w x y s B C D F G H J K L M N P Q R S T V W X Y S)

  (word.split('').map do |char|
    if consonants.include?(char) then char + char else char end
  end)
  .join("")
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""