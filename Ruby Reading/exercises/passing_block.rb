# def take_block(&block)
#   block.call
# end

# take_block do
#   puts "Block being called in method."
# end

# if we wanted to pass in an argument to the method as well

def take_block(number, &block)
  block.call(number)
end

number = 24
take_block(number) do |num|
  puts "Block being called in method. #{num}."
end