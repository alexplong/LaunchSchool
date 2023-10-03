def n_lights(n)
  light_array = (1..n).to_a.map { false }
  counter = 1
  
  loop do

    light_array = light_array.map.with_index { |light, idx| if (idx + 1) % counter == 0 then !light else light end}
    counter += 1
    break if counter > n

  end
  light_array.map.with_index {|num, idx| idx + 1 if num == true}.select {|elem| elem}
end


def n_lights(n)
  light_array = (1..n).to_a.map { false }
  counter = 1
  
  loop do

    # this transformation loop flips the lights on multiples of counter
    # first iteration - multiples of counter: 1 is every iteration to turn on
    # second iteration - multiples of counter: 2 is every even ... and so forth
    light_array = light_array.map.with_index do |light, idx| 
        if (idx + 1) % counter == 0 
          !light 
        else 
          light 
        end
      end
    counter += 1
    break if counter > n

  end

  # transform all true elements to their flip number
  # select and filter those numbers in a new array as they are truthy values
  (light_array.map.with_index do |num, idx| 
    idx + 1 if num == true
  end)
  .select do |elem| 
    elem
  end

end




p n_lights(5)
p n_lights(1000)