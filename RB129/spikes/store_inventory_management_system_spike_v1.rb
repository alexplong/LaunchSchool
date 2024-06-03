## STORE INVENTORY MANAGEMENT SYSTEM
# + You are tasked with implementing a program that simulates a basic inventory management system for a small store. The store has a limited number of items in stock, and the system should allow for adding items to the inventory, updating the stock levels, and retrieving the current stock levels for each item.

# Your program should have the following functionalities:
# + Add an item to the inventory: Allow the user to input the name, price, and initial stock level for a new item, and add it to the inventory. 
# + Update stock levels: Allow the user to update the stock level of an existing item in the inventory by specifying the item name and the new stock level.
# + Retrieve stock levels: Allow the user to retrieve the current stock level for a specific item in the inventory by specifying the item name.


##
# You are tasked with implementing a program that simulates a basic inventory management system for a small store. 
# The store has a limited number of items in stock, and the system should allow for adding items to the inventory, updating the stock levels, and retrieving the current stock levels for each item.

class InventoryManagementSystem
  def initialize
    @inventory = {} # {item_name: {price: 5.00, stock_level: 10}}
  end

  def add(name, price, stock_level)
    @inventory[name] = {price: price, stock_level: stock_level}
  end

  def update(name, new_stock_level)
    @inventory[name][:stock_level] = new_stock_level
  end

  def current_stock_level(name)
    @inventory[name][:stock_level]
  end
end

small_store = InventoryManagementSystem.new

# Your program should have the following functionalities:
# Add an item to the inventory: Allow the user to input the name, price, and initial stock level for a new item, and add it to the inventory. 
small_store.add('banana', 0.50, 100)

# Update stock levels: Allow the user to update the stock level of an existing item in the inventory by specifying the item name and the new stock level.
small_store.update('banana', 50)

# Retrieve stock levels: Allow the user to retrieve the current stock level for a specific item in the inventory by specifying the item name.
p small_store.current_stock_level('banana')