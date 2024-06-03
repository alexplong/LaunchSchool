require "pry"

# - A meal always has three meal items: a burger, a side, and drink.
# - For each meal item, the customer must choose an option.
# - The application must compute the total cost of the order.

# 1. Identify the nouns and verbs we need in order to model our classes and methods.
# 2. Create an outline in code (a spike) of the structure of this application.
# 3. Place methods in the appropriate classes to correspond with various verbs.


# 1 
# Meal
# - responsibilities
#   - has 3 meal items: a burger, a side, and a drink
# - collaborators
#   - Burger
#   - Side
#   - Drink

# Meal Item
# - responsibilities
#   - can prompt customer to choose an option for each item

# Burger
# - responsibilities
#   - has burger options
#   - can choose one of the options

# Side
# - responsibilities
#   - has side options
#   - can choose one of the options

# Drink
# - responsibilities
#   - has drink options
#   - can choose one of the options

# Customer
# - responsibilities
#   - has a meal order
# - collaborators
#   - meal

# Application
# - responsibilities
#   - can compute total cost of the order
# - collaborators
#   - customer


class Meal
  attr_reader :items

  def initialize
    @items =[Burger.new, Side.new, Drink.new]
  end
end

class MealItem
  attr_reader :selection, :cost

  def initialize
    print_options
    @selection = choose_option
  end

  private
  
  def print_options
    puts ""
    self.class::OPTIONS.each.with_index do |(item, cost), idx|
      puts "#{idx + 1}. #{item} - $#{cost}"
    end
  end

  def choose_option
    choice = nil

    loop do
      puts "=> Please select a #{self.class.to_s.downcase} (1-#{self.class::OPTIONS.size}) from one of the options:"
      choice = gets.chomp.to_i
      break if (choice > 0) && (choice <= self.class::OPTIONS.size)
      puts "=> Please selection a valid #{self.class.to_s.downcase} option."
    end

    @selection = self.class::OPTIONS.keys[choice - 1]
    @cost = self.class::OPTIONS[selection]
  end
end

class Burger < MealItem
  OPTIONS = {
    "Hamburger" => 1.99,
    "Cheeseburger" => 2.25,
    "Doubleburger" => 2.99,
    "Double Cheeseburger" => 3.50,
    "Pastrami Burger" => 4.99
}
end

class Side < MealItem
  OPTIONS = {
    "Fries (small)" => 1.25,
    "Fries (medium)" => 1.75,
    "Fries (large)" => 2.25,
    "Onion Rings" => 2.99,
    "Curly Fries" => 2.99
}
end

class Drink < MealItem
  OPTIONS = {
    "Soda (small)" => 1.25,
    "Soda (medium)" => 1.75,
    "Soda (large)" => 2.25,
    "Lemonade" => 2.25,
    "Smoothie" => 3.50
}
end

class Customer
  attr_reader :order

  def initialize
    @order = Meal.new
  end
end

class Application
  attr_reader :customer

  def initialize
    puts "=> Hello Customer Welcome to the Hub." 
    puts "=> Please choose an option for each"
    puts "=> meal item for your order."
    @customer = Customer.new
    print_customer_order
  end

  private

  def print_customer_order
    meal_items = customer.order.items.map(&:selection).join(', ')
    puts "You ordered the #{meal_items}. Your total is: #{order_total}"
  end

  def order_total
    customer.order.items.map(&:cost).sum
  end
end


x = Application.new
binding.pry