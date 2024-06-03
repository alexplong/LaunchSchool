class Anagram
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def match(arr)
    arr.select do |other_word| 
      if word.downcase == other_word.downcase
        false
      else
        anagram? other_word 
      end
    end
  end

  private

  def anagram?(other)
    word.downcase.chars.sort == other.downcase.chars.sort
  end
end