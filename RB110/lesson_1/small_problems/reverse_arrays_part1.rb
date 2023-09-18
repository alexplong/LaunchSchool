def reversed(arr)
  return arr if arr.length == 0
  frontend = 0
  backend = -1

  # divisor = arr.length.odd? ? arr.length / 2 : (arr.length / 2) - 1

  while frontend < arr.length / 2

    backend_value = arr[backend]
    arr[backend] = arr[frontend]
    arr[frontend] = backend_value
    frontend += 1
    backend -= 1
  end

  arr
end


p list = [1,2,3,4]
p result = reversed(list)

p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true
p result.object_id

# p list = %w(a b e d c)
# puts reversed(list) == ["c", "d", "e", "b", "a"] # true
# puts list == ["c", "d", "e", "b", "a"] # true

# p list = ['abc']
# puts reversed(list) == ["abc"] # true
# puts list == ["abc"] # true

# p list = []
# puts reversed(list) == [] # true
# puts list == [] # true