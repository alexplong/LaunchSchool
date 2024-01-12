# Consider the following class:
# Modify this class so both flip_switch and the setter method switch= are private methods.

class Machine
  def start
    flip_switch(:on)  # self.flip_switch(:on) is okay is newer versions of Ruby
  end
  
  def stop
    flip_switch(:off) # self.flip_switch(:off) okay
  end
  
  private

  attr_writer :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

