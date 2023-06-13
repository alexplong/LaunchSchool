def greeting(name)
  "Hello #{name}"
end

puts greeting("Alex")

def mult(x,y)
  x * y
end

puts mult(2,8)

def scream(words)
  words = words + "!!!!"
  # return  # return here won't let the next line execute
  puts words
end

scream("Yippeee")