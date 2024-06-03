class SumOfMultiples
  attr_reader :factors

  def initialize(*factors)
    @factors = factors.empty? ? [3, 5] : factors
  end

  def to(num)
    all_multiples = get_multiples(num)
    all_multiples.uniq.sum
  end

  def self.to(num)
    quick_test = SumOfMultiples.new
    quick_test.to(num)
  end

  private

  def get_multiples(num)
    output = []

    factors.each do |factor|
      curr_multiple = factor

      while curr_multiple < num
        output << curr_multiple
        curr_multiple += factor
      end
    end
    output
  end
end