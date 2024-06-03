class Scrabble
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def score
    return 0 unless word.instance_of? String
    curr_score = 0

    word.upcase.chars.each do |char|
      curr_score += score_letter(char)
    end

    curr_score
  end

  def self.score(word)
    Scrabble.new(word).score
  end

  private

  def score_letter(char)
    case char
    when 'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T' then 1
    when 'D', 'G' then 2
    when 'B', 'C', 'M', 'P' then 3
    when 'F', 'H', 'V', 'W', 'Y' then 4
    when 'K' then 5
    when 'J', 'X' then 8
    when 'Q', 'Z' then 10
    else 0
    end
  end
end