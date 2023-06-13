

def check_arr(arr, number)

  if arr.include?(number)
    "Your number is in the array"
  else 
    "Your number is not in the array"
  end

end


puts check_arr([1, 3, 5, 7, 9, 11], 3)