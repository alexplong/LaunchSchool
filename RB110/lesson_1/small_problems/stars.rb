def fill_starline(arr)
  arr[0] = "*"
  arr[-1] = "*"
  arr[arr.length / 2] = "*"
  arr
end

def star(n)
  
  top_star = n
  bot_star = 3
  max_distance = (n / 2)
  spaces = [" "]

  loop do
    x = spaces * top_star
    puts fill_starline(x).join.center(n)
    top_star -= 2
    break if top_star < (n / 2 - 1)
  end
  

  puts "*" * n

  loop do
    y = spaces * bot_star
    puts fill_starline(y).join.center(n)
    bot_star += 2
    break if bot_star > n
  end
end

star(7)