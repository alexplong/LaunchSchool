

def to_zero(int)
  
  if int > 0
    puts int
    to_zero(int - 1)
  else 
    puts int
  end


end


puts to_zero(10)