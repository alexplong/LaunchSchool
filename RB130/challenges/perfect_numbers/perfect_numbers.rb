class PerfectNumber
  def self.classify(num)
    raise StandardError if num < 1
    aliquot_sum = sum_of_factors(num).sum

    case aliquot_sum <=> num
    when -1 then "deficient"
    when 0 then "perfect"
    when 1 then "abundant"
    end
  end


  class << self
    private

    def sum_of_factors(num)
      divisors = []
      (1...num).each do |n|
        divisors << n if num % n == 0
      end
      divisors
    end
  end
end