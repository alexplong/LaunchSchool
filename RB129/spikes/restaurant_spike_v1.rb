## RESTAURANT SPIKE
# + Restaurant has staff, and they all work and get paid
# + Restaurant has servers that wear white shirts, serve orders and interact with customers
# + Managers wear black shirts, can check inventory, serve orders and interact with customers
# + Cooks can cook and check inventory, wear striped shirts
# + Hosts seat guests and distribute menus, and interact with customers


# Restaurant has staff, and they all work and get paid
class Restaurant
  STAFF_HOURLY_RATE = 15.00

  attr_reader :name
  attr_accessor :staff

  def initialize(name)
    @name = name
    @staff = []
  end

  def pay_staff
    @staff.each do |employee|
      puts "Direct deposit initialized for #{employee.name}: $#{STAFF_HOURLY_RATE * employee.hours_worked} x #{employee.hours_worked} hours."
      employee.hours_worked = 0
    end
  end
end

class Employee
  attr_reader :name, :employer
  attr_accessor :hours_worked

  def initialize(name, employer)
    @name = name
    @employer = employer
    @hours_worked = 0
  end

  def work
    self.hours_worked += 8
    puts "#{self.name} putting in hours at #{employer}."
  end
end


outback = Restaurant.new("Outback")

# Restaurant has servers that wear white shirts, serve orders and interact with customers
module SharedServingDuties
  def serve_order
  end
end

module SharedCustomerInteractionDuties
  def interact_with_customers
  end
end

module SharedInventoryDuties
  def check_inventory
  end
end

class Server < Employee
  include SharedServingDuties
  include SharedCustomerInteractionDuties

  def initialize(name, employer)
    super
    @uniform = 'white shirt'
  end
end

outback.staff = [Server.new('Steve', "Outback"), Server.new('Sammi', "Outback")]
p outback

outback.staff.each(&:work)
outback.pay_staff

# Managers wear black shirts, can check inventory, serve orders and interact with customers
class Manager < Employee
  include SharedServingDuties
  include SharedCustomerInteractionDuties
  include SharedInventoryDuties

  def initialize(name, employer)
    super
    @uniform = 'black shirt'
  end
end

# Cooks can cook and check inventory, wear striped shirts
class Cook < Employee
  include SharedInventoryDuties

  def initialize(name, employer)
    super
    @uniform = 'striped shirt'
  end

  def cook
  end
end

# Hosts seat guests and distribute menus, and interact with customers
class Host < Employee
  include SharedCustomerInteractionDuties

  def seat_guests
  end

  def distribute_menus
  end
end
