
class Vehicle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def to_s
    "#{make} #{model}"
  end

  def wheels
    self.class::NUMBER_WHEELS
  end

end


class Car < Vehicle
  NUMBER_WHEELS = 4
end

class Motorcycle < Vehicle
  NUMBER_WHEELS = 2
end

class Truck
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end

  NUMBER_WHEELS = 6
end