def center_of(phrase)

  double = phrase.length.even? ? true : false
  half = phrase.length / 2

  if double then "#{phrase[half - 1]}#{phrase[half]}" else "#{phrase[half]}" end

end

puts center_of("yoy")
puts center_of('Launch School')
puts center_of('I love Ruby')
puts center_of('Launch')
puts center_of('Launchschool')
puts center_of('x')

