def longest_sentence(file)

  contents = IO.read(file)
  sentences = contents.split(/[.!?]/)
  sentence_lengths = sentences.map {|n| n.split.length}
  longest_length = sentence_lengths.max
  puts sentences[sentence_lengths.index(longest_length)]
  puts "#{longest_length} words"
end

longest_sentence("pg84.txt")