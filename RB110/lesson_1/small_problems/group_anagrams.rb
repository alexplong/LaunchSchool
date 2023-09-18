def character_library(word)
  word.split('').each_with_object({}) { |char, count|
    if count.has_key?(char) then count[char] += 1 else count[char] = 1 end }
end


def group_anagrams(words)

  words_dictionary = words.each_with_object({}) do |element, collection|
    collection[element] = {count: character_library(element), used: false}
  end

  anagrams = []
  anagram = []

  words.each do |word|
    if words_dictionary[word][:used] then next else words_dictionary[word][:used] = true end
    anagram = [word]

    words_dictionary.each do |key, properties|
      next if properties[:used]
      if words_dictionary[word][:count] == words_dictionary[key][:count] 
        anagram << key 
        words_dictionary[key][:used] = true
      end
    end
    anagrams << anagram if anagram.length > 1
  end
  anagrams.each {|anagram| p anagram}
  nil
end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

puts group_anagrams(words)