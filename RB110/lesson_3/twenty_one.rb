require "pry"

SUIT = ('2'..'10').to_a +
       %w(jack queen king ace)

       
def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  deck = SUIT + SUIT + SUIT + SUIT
  deck.shuffle
end

def deal_cards(deck, player, dealer)
  player << deck.pop
  dealer << deck.pop
  player << deck.pop
  dealer << deck.pop
end

loop do

  dealer = []
  player = []

  deck_of_cards = initialize_deck             
  deal_cards(deck_of_cards, player, dealer)

  loop do

    puts "Dealer has: #{dealer[0]} and unknown card"
    puts "You have: #{player}"
    prompt("hit or stay?")
    player_input = gets.chomp
    break if player_input.downcase.starts_with("s")
  end





end