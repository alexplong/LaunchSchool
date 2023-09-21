require "pry"

SUITS = %w(H D C S)
VALUES = ('2'..'10').to_a +
         %w(J Q K A)

def prompt(msg)
  puts "=> #{msg}"
end

def player_turn_prompt(player_hand, dealer_hand)
  system "clear"
  puts "Dealer has: #{dealer_hand[0][1]} and unknown card"
  puts "You have: #{joinor(player_hand)}"
end

def dealer_turn_prompt(player_hand, dealer_hand)
  system "clear"
  puts "Dealer has: #{joinor(dealer_hand)}"
  puts "You have: #{joinor(player_hand)}"
end

def detect_result(dealer_hand, player_hand)
  player_total = total(player_hand)
  dealer_total = total(dealer_hand)

  if player_total > 21
    :player_busted
  elsif dealer_total > 21
    :dealer_busted
  elsif dealer_total > player_total
    :dealer
  elsif dealer_total < player_total
    :player
  else
    :tie
  end
end

def display_result(dealer_hand, player_hand)
  result = detect_result(dealer_hand, player_hand)

  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "Congrats! You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

# refactor: improve with Array#product
def initialize_deck
  deck = []
  SUITS.each do |suit|
    VALUES.each do |value|
      deck << [suit, value]
    end
  end
  deck.shuffle
end

def deal_cards(deck, player_hand, dealer_hand)
  2.times do
    player_hand << deck.pop
    dealer_hand << deck.pop
  end
end

def joinor(player_hand, delimiter=', ', word='and')
  cards = player_hand.map { |card| card[1] }

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

def play_again?
  puts "Would you like to play again? (y or n)"
  again = gets.chomp
  again.downcase.start_with?('n')
end

loop do
  dealer_hand = []
  player_hand = []

  deck = initialize_deck
  deal_cards(deck, player_hand, dealer_hand)

  player_turn_prompt(player_hand, dealer_hand)

  # player turn
  loop do
    prompt("Would you like to hit or stay?")
    player_input = gets.chomp
    hit(deck, player_hand) if player_input.downcase.start_with?('h')
    player_turn_prompt(player_hand, dealer_hand)
    break if player_input.downcase.start_with?('s') || bust?(player_hand)
  end

  if bust?(player_hand)
    puts "Sorry you busted your hand." 
    break if play_again?
  else
    puts "Dealer turn!"
  end

  # dealer turn
  loop do
    dealer_turn_prompt(player_hand, dealer_hand)
    break if total(dealer_hand) >= 17 || bust?(dealer_hand)
    puts "Dealer will hit! Press any key to continue"
    gets
    hit(deck, dealer_hand)
  end

  # both player and dealer stays - compare cards
  puts "============"
  puts "Dealer has #{joinor(dealer_hand)}, for a total of: #{total(dealer_hand)}"
  puts "Player has #{joinor(player_hand)}, for a total of: #{total(player_hand)}"
  puts "============"

  display_result(dealer_hand, player_hand)
  break if play_again?
end
