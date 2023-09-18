def greetings(name, specialty)

  "Hello #{name.join(' ')}! Nice to have a #{specialty[:title]} #{specialty[:occupation]} around."
end


puts greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })

