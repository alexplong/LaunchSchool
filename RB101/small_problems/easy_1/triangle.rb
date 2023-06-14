def triangle(size)

for n in 1..size
    # n is line
    space = size - n
    fill = n
    line = ""
    space.times do
        line << " "
    end
    fill.times do
        line << "*"
    end
    puts line
end

end


   #
  ##
 ###
####

triangle(9)