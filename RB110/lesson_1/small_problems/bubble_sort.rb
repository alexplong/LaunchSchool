def bubble_sort!(array)

  position = 0
  exchanges = 0

  loop do
    if (array[position] <=> array[position + 1]) == 1
      temp = array[position + 1]
      array[position + 1] = array[position]
      array[position] = temp
      exchanges += 1
    end

    position += 1

    break if exchanges == 0 && position == array.length - 1
    position, exchanges = [0, 0] if position == array.length - 1
  end
  array
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)