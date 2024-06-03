class Octal
  attr_reader :octal

  def initialize(value)
    valid?(value) ? @octal = value.to_i.to_s : @octal = '0'
  end

  def to_decimal
    base_8_nums = octal.to_i.digits
    base_10_transform = 0

    base_8_nums.each.with_index do |digit, idx_power|
      base_10_transform += (digit * (8**idx_power))
    end
    
    base_10_transform
  end

  private

  def valid?(value)
    value.chars.all? {|n| n =~ /[0-7]/ }
  end
end