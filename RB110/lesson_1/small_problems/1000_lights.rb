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

p n_lights(5)
p n_lights(1000)