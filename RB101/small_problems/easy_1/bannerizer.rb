def phrase_chunker(phrase)
    
    
end



def print_in_box(phrase)
    
    y_edge = ""
    fill_space = ""
    
    phrase.length.times do
        y_edge << "-"
        fill_space << " "
    end
    
    puts "+-#{y_edge}-+"
    puts "| #{fill_space} |"
    puts "| #{phrase} |"
    puts "| #{fill_space} |"
    puts "+-#{y_edge}-+"    
    
end


print_in_box("blah")
print_in_box('To boldly go where no one has gone before.')

# Modify this method so it will truncate the message if it will be too wide to fit 
# inside a standard terminal window (80 columns, including the sides of the box). 
# For a real challenge, try word wrapping very long messages so they appear on multiple 
# lines, but still within a box.