=begin

- reading Ruby's syntactical sugar
- where does the code come from?
- variable scope
- pass by reference vs pass by value
- questions

=end

# Ruby syntax has alot of syntactical sugar - in order to appear more expressive and english like, it hides alot of fundamental or underlying mechanism

# something looks like operator but its a method call, etc
# puts "hello"


def str
	"a method"
end
str = "a string"

p str