def multiply_all_pairs(arr1, arr2)

  product_output = []

  arr1.each do |num1|
    arr2.each do |num2|
      product_output << num1 * num2
    end

  end
  product_output.sort
end

puts multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]