def multiply_list(arr1, arr2)

  product_output = []
  arr1.each_with_index do |number, index|
    product_output << number * arr2[index]
  end
  product_output
end

puts multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]