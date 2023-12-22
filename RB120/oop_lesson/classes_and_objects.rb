class Person
  attr_accessor :first_name, :last_name
  
  def initialize(full_name)
    parse_name(full_name)
  end

  def name
    [first_name, last_name].join(' ').strip
  end

  def name=(full_name)
    parse_name(full_name)
  end

  def to_s
    name
  end
  
  private
  
  def parse_name(full_name)
    name_parts = full_name.split
    name_parts[1] = '' if name_parts[1].nil?
    self.first_name, self.last_name = name_parts
  end

end

# bob = Person.new('Robert')
# p bob.name                  # => 'Robert'
# p bob.first_name            # => 'Robert'
# p bob.last_name             # => ''
# p bob.last_name = 'Smith'
# p bob.name                  # => 'Robert Smith'

# bob.name = "John Adams"
# p bob.first_name            # => 'John'
# p bob.last_name             # => 'Adams'


bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

p bob.name == rob.name
puts "The person's name is: #{bob}"
