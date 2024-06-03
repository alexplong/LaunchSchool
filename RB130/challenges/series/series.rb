class Series
  attr_reader :value

  def initialize(numbers)
    @value = numbers
  end

  def slices(length)
    raise ArgumentError if length > value.size
    counter = 0
    output = []

    while counter + length <= value.size
      output << value[counter, length].chars.map(&:to_i)
      counter += 1
    end

    output
  end
end
