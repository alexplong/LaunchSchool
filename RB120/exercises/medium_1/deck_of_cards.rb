=begin
Using the Card class from the previous exercise, create a Deck class that contains all of the standard 52 playing cards. Use the following code to start your work:
=end

class Card
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other_card)
    if value < other_card.value
      # self
      -1
    elsif value == other_card.value
      # self
      0
    elsif value > other_card.value
      # other_card
      1
    end
  end

  def ==(other_card)
    (rank == other_card.rank && suit == other_card.suit)
  end

  def to_s
    "#{rank} of #{suit}"
  end

  protected

  def value
    if rank.to_s.to_i != rank
      case rank
      when 'Jack' then 11
      when 'Queen' then 12
      when 'King' then 13
      when 'Ace' then 14
      end
    else
      rank
    end
  end
end

# The Deck class should provide a #draw method to deal one card. The Deck should be shuffled when it is initialized and, if it runs out of cards, it should reset itself by generating a new set of 52 shuffled cards.

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    set_cards
  end

  def draw
    set_cards if @cards.empty?
    @cards.pop  
  end

  private

  def set_cards
    @cards = RANKS.each_with_object([]) do |rank, cards|
      SUITS.map do |suit|
        cards << Card.new(rank, suit)
      end
    end.shuffle
  end
end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
# puts drawn
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
drawn != drawn2 # Almost always.