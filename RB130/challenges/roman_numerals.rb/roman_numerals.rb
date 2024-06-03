class RomanNumeral
  RNTABLE = {
    1000 => "M",
    900 => "CM",
    500 => "D",
    400 => "CD", 
    100 => "C",
    90 => "XC",
    50 => "L",
    40 => "XL",
    10 => "X",
    9 => "IX",
    5 => "V",
    4 => "IV",
    1 => "I"
  }

  attr_accessor :value

  def initialize(value)
    @value = value
  end

  def to_roman
    roman_values = RNTABLE.keys
    output = ''

    while value > 0
      roman_values.each do |roman_value|
        next if roman_value > value
        curr_quot, curr_rem = value.divmod(roman_value)
        output += RNTABLE[roman_value] * curr_quot
        self.value = curr_rem
        break
      end
    end

    output
  end
end