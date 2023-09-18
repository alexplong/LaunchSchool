def buy_fruit(list)
  list.each_with_object([]) {|items, grocery_list| items[1].times {grocery_list<<items[0]}}

end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]