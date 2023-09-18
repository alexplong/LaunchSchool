def halvsies(input)

  midline = input.length.odd? ? (input.length / 2) : (input.length / 2) - 1
  input.each_with_object([[],[]]).with_index do |(elem, split_array), index|
    if index <= midline
      split_array[0] << elem
    else
      split_array[1] << elem
    end
  end
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]