def last_visited_integers(arr)
	counter, output, stack = [0, [], []]

	loop do
		word = arr[counter]
		
		if word.to_i.to_s == word
			stack << word.to_i 
			counter += 1
					
    elsif word == "prev" && arr[counter + 1] != "prev"
			output << stack[-1]
			counter += 1
			
		else

      k = 1

      while arr[counter + 1] == "prev"
        k += 1
        counter += 1
      end

      if k > 0
        if k == stack.size
          output = output + stack[-k..-1].reverse
        else
          missing = k - stack.size
          output = output + stack.reverse
          missing.times { |_| output.push(-1) }
        end
      end

    counter += 1
    end
		break if counter >= arr.size
	end
	output
end


# words = ["1","prev","2","prev","prev"]
# p last_visited_integers(words)


words =["1","2","prev","prev","prev"]
p last_visited_integers(words)
