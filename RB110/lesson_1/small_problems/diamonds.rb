# def diamond(n)

#   return puts "*" if n == 1
#   counter = 1

#   loop do
#     puts (1..counter).to_a.map{"*"}.join.center(n)
#     counter += 2
#     break if counter > n
#   end
#   counter = n
#   loop do
#     counter -= 2
#     puts (1..counter).to_a.map{"*"}.join.center(n)
#     break if counter == 1
#   end
# end


def line_of_diamonds(n, counter)
    puts (1..counter).to_a.map{"*"}.join.center(n)
end

def diamond(n)
  counter = 1
  while counter < n 
    line_of_diamonds(n, counter)
    counter += 2
  end
  while counter > 0
    line_of_diamonds(n, counter)
    counter -= 2
  end
end

diamond(9)