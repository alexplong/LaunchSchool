require "pry"

SUITS = %w(H D C S)
VALUES = ('2'..'10').to_a +
         %w(J Q K A)

def prompt(msg)
  puts "=> #{msg}"
end

def player_turn_prompt(player, dealer)
  system "clear"
  puts "Dealer has: #{dealer[0][1]} and unknown card"
  puts "You have: #{joinor(player)}"
end

def dealer_turn_prompt(player, dealer)
  system "clear"
  puts "Dealer has: #{joinor(dealer)}"
  puts "You have: #{joinor(player)}"
end

def initialize_deck
  deck = []
  SUITS.each do |suit|
    VALUES.each do |value|
      deck << [suit, value]
    end
  end
  deck.shuffle
end

def deal_cards(deck, player, dealer)
  2.times do
    player << deck.pop
    dealer << deck.pop
  end
end

def joinor(player, delimiter=', ', word='and')
  cards = player.map { |card| card[1] }

  if cards.length > 2
    cards[-1] = "#{word} #{cards[-1]}"
    cards.join(delimiter)
  else
    cards.join(" #{word} ")
  end
end

def hit(deck, curr_player)
  curr_player << deck.pop
end

# rubocop:disable Metrics/MethodLength
def total(cards)
  values = cards.map { |card| card[1] }

  sum = 0
  aces = 0

  values.each do |card|
    if card == "A"
      sum += 11
      aces += 1
    elsif card != card.to_i.to_s
      sum += 10
    else
      sum += card.to_i
    end
  end

  while sum > 21 && aces > 0
    sum -= 10
    aces -= 1
  end

  sum
end
# rubocop:enable Metrics/MethodLength

def bust?(cards)
  total(cards) > 21
end

loop do
  dealer = []
  player = []

  deck = initialize_deck
  deal_cards(deck, player, dealer)

  player_turn_prompt(player, dealer)

  loop do
    prompt("hit or stay?")
    player_input = gets.chomp
    hit(deck, player) if player_input.downcase.start_with?('h')
    player_turn_prompt(player, dealer)
    break if player_input.downcase.start_with?('s') || bust?(player)
  end

  if bust?(player)
    puts "Sorry you busted your hand. Play again? (y or n)"
    again = gets.chomp
    break if again.downcase.start_with?('n')
  else
    puts "Dealer turn!"
  end

  loop do
    dealer_turn_prompt(player, dealer)
    break if total(dealer) >= 17 || bust?(dealer)
    puts "Dealer will hit! Press any key to continue"
    hit(deck, dealer)
  end

  puts "Dealer has #{total(dealer)} and you have #{total(player)}"
  if total(player) < total(dealer) || total(dealer) > 21
    puts "Congrats! You win! Play again? (y or n)"
  elsif total(player) == 21 && total(dealer) == 21
    puts "It's a tie! Play again? (y or n)"
  else
    puts "Sorry! You lose :( Play again? (y or n)"
  end
  play_again = gets.chomp
  break if play_again.downcase.start_with?('n')
end
