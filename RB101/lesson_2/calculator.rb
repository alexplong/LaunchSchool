# ask user for two nmbers
# ask user for operation to perform
# perform operation
# output result


Kernel.puts("Please enter the first number: ")
x = Kernel.gets().chomp()


Kernel.puts("Please enter teh second number: ")
y = Kernel.gets().chomp()

Kernel.puts("Which operation would you like to perform: 1) add, 2) subtract, 3) multiply, or 4) divide")
selection = Kernel.gets().chomp()

case selection
when "1"
    puts x.to_i() + y.to_i()
when "2"
    puts x.to_i() - y.to_i()
when "3"
    puts x.to_i() * y.to_i()
else
    puts x.to_f() / y.to_f()
end

