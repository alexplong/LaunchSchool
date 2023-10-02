def center_of(phrase)

  # old
  # double = phrase.length.even? ? true : false
  # half = phrase.length / 2
  # if double then "#{phrase[half - 1]}#{phrase[half]}" else "#{phrase[half]}" end
  
  if phrase.length.odd? then phrase[phrase.length / 2] else phrase[(phrase.length / 2) - 1, 2] end

end

puts center_of("yoy")
puts center_of('Launch School')
puts center_of('I love Ruby')
puts center_of('Launch')
puts center_of('Launchschool')
puts center_of('x')

