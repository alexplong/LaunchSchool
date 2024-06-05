class Diamond
  REF_ALPHABET = ('A'..'Z').to_a

  def self.make_diamond(char)
    top_diamond = []
    bot_diamond = []
    diamond_char_idx = REF_ALPHABET.index(char)

    diamond_char_idx.downto(0) do |val|
      curr_char = REF_ALPHABET[diamond_char_idx - val]
      curr_line = create_row(curr_char, val)
      top_diamond.push(curr_line)
      bot_diamond.unshift(curr_line) unless val.zero?
    end

    top_diamond.join + bot_diamond.join
  end

  class << self
    private

    def create_row(char, flank_space)
      case char
      when 'A' then "#{' ' * flank_space}A#{' ' * flank_space}\n"
      when 'B' then "#{' ' * flank_space}B B#{' ' * flank_space}\n"
      else "#{' ' * flank_space}#{char}#{' ' * determine_middle_space(char)}#{char}#{' ' * flank_space}\n"
      end
    end

    def determine_middle_space(char)
      (-1 + (2 * REF_ALPHABET.index(char)))
    end
  end
end
