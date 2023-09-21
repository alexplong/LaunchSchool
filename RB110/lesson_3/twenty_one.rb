require "pry"

SUITS = %w(H D C S)
VALUES = ('2'..'10').to_a +
         %w(J Q K A)
STOP_HIT = 17
WIN_SCORE = 21
FACE_CARD = 10
ACES = 11

def prompt(msg)
  puts "=> #{msg}"
end

def player_turn_prompt(player_hand, player_total)
  puts ""
  puts "Your cards are now: #{joinor(player_hand)}"
  puts "Your total is now: #{player_total}"
end

def dealer_turn_prompt(dealer_hand)
  puts ""
  puts "Dealer cards are now: #{joinor(dealer_hand)}"
end

def detect_result(dealer_hand, player_hand)
  player_total = total(player_hand)
  dealer_total = total(dealer_hand)

  if player_total > WIN_SCORE
    :player_busted
  elsif dealer_total > WIN_SCORE
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

def end_of_round_output(dealer_hand, player_hand, dealer_total, player_total)
  puts ""
  puts "============"
  puts "Dealer has #{joinor(dealer_hand)}, for a total of: #{dealer_total}"
  puts "Player has #{joinor(player_hand)}, for a total of: #{player_total}"
  puts "============"
  puts ""
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

def deal_initial_cards(deck, player_hand, dealer_hand)
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

def add_score(point_total, card)
  if card == "A"
    point_total += ACES
  elsif card != card.to_i.to_s
    point_total += FACE_CARD
  else
    point_total += card.to_i
  end

  point_total -= 10 if point_total > WIN_SCORE && card == "A"
  point_total
end

# rubocop:disable Metrics/MethodLength
def total(cards)
  values = cards.map { |card| card[1] }

  sum = 0
  aces = 0

  values.each do |card|
    if card == "A"
      sum += ACES
      aces += 1
    elsif card != card.to_i.to_s
      sum += FACE_CARD
    else
      sum += card.to_i
    end
  end

  while sum > WIN_SCORE && aces > 0
    sum -= 10
    aces -= 1
  end

  sum
end
# rubocop:enable Metrics/MethodLength

def bust?(current_total)
  current_total > WIN_SCORE
end

def continue_prompt
  prompt "Press Enter to continue."
  gets
end

def play_again?
  puts "Would you like to play again? (y or n)"
  again = nil
  loop do
    again = gets.chomp
    break if again != nil && ['y', 'n'].include?(again.downcase[0])
    puts "Please enter a valid selection."
  end
  puts ""
  again.downcase.start_with?('y')
end

loop do
  system "clear"
  dealer_hand = []
  player_hand = []

  deck = initialize_deck
  deal_initial_cards(deck, player_hand, dealer_hand)
  
  player_total = total(player_hand)
  dealer_total = total(dealer_hand)

  puts "Dealer has: #{dealer_hand[0][1]} and unknown card"
  puts "You have: #{joinor(player_hand)}, for a total of #{player_total}"

  # player turn
  loop do
    prompt("Would you like to hit or stay?")
    player_input = gets.chomp
    puts ""
    if player_input.downcase.start_with?('h')
      prompt "You decided to hit!"
      hit(deck, player_hand)
      player_total = add_score(player_total, player_hand[-1][1])
      player_turn_prompt(player_hand, player_total)
    elsif player_input.downcase.start_with?('s')
      prompt "You decided to stay!"
    else
      prompt "Please enter a valid selection."
    end
    break if player_input.downcase.start_with?('s') || bust?(player_total)
  end

  if bust?(player_total)
    end_of_round_output(dealer_hand, player_hand, dealer_total, player_total)
    display_result(dealer_hand, player_hand)
    play_again? ? next : break 
  else
    puts "Dealer turn!"

    # dealer turn
    continue_prompt
    puts "Dealer cards are: #{joinor(dealer_hand)}, for a total of #{dealer_total}"
    # dealer turn goes too fast: add prompt when decide to hit and stay
    loop do
      if dealer_total >= STOP_HIT || bust?(dealer_total)
        break
      else
        puts "Dealer will hit!"
        hit(deck, dealer_hand)
        dealer_total = add_score(dealer_total, dealer_hand[-1][1])
        dealer_turn_prompt(dealer_hand)
        continue_prompt
      end
    end
  end

  if bust?(dealer_total)
    end_of_round_output(dealer_hand, player_hand, dealer_total, player_total)
    display_result(dealer_hand, player_hand)
    play_again? ? next : break 
  else
    puts "Dealer will stay! Let's compare cards!"
  end
  continue_prompt

  # both player and dealer stays - compare cards
  end_of_round_output(dealer_hand, player_hand, dealer_total, player_total)
  display_result(dealer_hand, player_hand)
  break unless play_again?  # Y works here
end
