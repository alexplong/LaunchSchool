require 'pry'

module Hand
  def set_hand
    self.hand = []
  end

  def add_card_to_hand(card)
    hand << card
  end

  def show_hand
    puts "---- #{name}'s Hand ----"
    hand.each do |card|
      puts "==> #{card}"
    end
    puts "==> Total: #{hand_total}"
    puts "BUSTED!!!" if busted?
    puts ""
  end

  def last_card_dealt
    hand.last
  end

  def hand_total
    cards = hand_values
    aces = cards.count('ace')
    total = tally_card_points(cards)

    aces.zero? ? total : check_aces(total, aces)
  end

  def busted?
    hand_total > 21
  end

  def not_busted?
    hand_total <= 21
  end

  private

  attr_accessor :hand

  def hand_values
    hand.map(&:face)
  end

  def tally_card_points(cards)
    total = 0

    cards.each do |card|
      next total += 11 if card == 'ace'
      next total += 10 if ['jack', 'queen', 'king'].include? card
      total += card.to_i
    end

    total
  end

  def check_aces(total, aces)
    while total > 21
      total -= 10
      aces -= 1
      break if total <= 21
    end

    total
  end
end

class Participant
  attr_reader :name

  include Hand

  def initialize(name)
    @name = name
    set_hand
  end
end

class Player < Participant
  def show_flop
    show_hand
  end
end

class Dealer < Participant
  attr_accessor :deck

  DEALER_NAMES = ['Chuck', 'The Dracula', 'Steve', 'Rick']

  def initialize(deck)
    super(DEALER_NAMES.sample)
    @deck = deck
  end

  def deal(player)
    player.add_card_to_hand(deck.top_card)
  end

  def show_flop
    puts "---- Dealer's Hand ----"
    puts "==> #{hand.first}"
    puts "==> ?? "
    puts ""
  end
end

class Deck
  SUITS = ['diamond', 'spade', 'heart', 'club']
  VALUES = ('2'..'10').to_a + %w(jack queen king ace)

  def initialize
    new_cards
  end

  def new_cards
    self.cards = []
    set_cards
    shuffle
  end

  def set_cards
    VALUES.each do |value|
      SUITS.each do |suit|
        cards << Card.new(suit, value)
      end
    end
  end

  def top_card
    cards.pop
  end

  def shuffle
    self.cards = cards.shuffle
  end

  def size
    cards.size
  end

  private

  attr_accessor :cards
end

class Card
  attr_reader :suit, :face

  def initialize(suit, value)
    @suit = suit
    @face = value
  end

  def to_s
    "The #{face.capitalize} of #{suit.capitalize}s"
  end
end

class Game
  attr_accessor :number_of_players
  attr_reader :deck, :dealer, :players

  def initialize
    @deck = Deck.new
    @dealer = set_dealer
    @number_of_players = nil
    @players = []
    set_players
  end

  def deal_cards
    clear
    deal_initial_cards_to_players
    deal_initial_cards_to_dealer
  end

  def show_flop
    players.each(&:show_flop)
    dealer.show_flop
  end

  def players_turn
    players.each do |player|
      [player, dealer].each(&:show_flop)
      display_player_turn_info(player.name, player.hand_total)
      participant_hit_or_stay_loop(player)
    end

    prompt_to_continue_and_clear
  end

  def all_players_busted?
    players.all?(&:busted?)
  end

  def dealer_turn
    dealer.show_hand

    if all_players_busted?
      puts "==> All players busted...."
      prompt_to_continue_and_clear
      return
    end

    dealer_hit_or_stay_loop
    prompt_to_continue_and_clear
  end

  def show_cards_and_result
    (players + [dealer]).each(&:show_hand)
    show_result
  end

  def determine_result
    dealer_total = dealer.hand_total

    players = find_possible_winners
    player_total = players.map(&:hand_total).first

    return dealer_won if all_players_busted?
    return players_won(players) if dealer.busted? ||
                                   player_total > dealer_total
    return dealer_won if dealer_total > player_total
  end

  def show_result
    winning_group, winner = determine_result

    case winning_group
    when :player then puts "#{winner.name} won!"
    when :players then puts "#{joinor(winner.map(&:name))} players won!"
    when :dealer then puts "You lose, dealer #{winner.name} wins!"
    end
  end

  def play_again?
    puts "==> play again? y/n"

    input = nil
    loop do
      input = gets.chomp.downcase
      break if ['y', 'n'].include?(input)
      puts "==> please enter y or n"
    end

    return true if input == 'y'
    return false if input == 'n'
  end

  def reset_hands
    players.each(&:set_hand)
    dealer.set_hand
  end

  def new_game_deck
    @deck.new_cards
  end

  def start
    loop do
      deal_cards # can add message when dealing
      players_turn
      dealer_turn
      show_cards_and_result
      break unless play_again?
      reset_hands
      new_game_deck
    end
    display_goodbye_message
  end

  private

  def set_dealer
    @dealer = Dealer.new(@deck)
  end

  def clear
    system 'clear'
  end

  def set_players
    display_welcome_message_and_players_prompt
    display_and_prompt_for_input_players
  end

  def display_and_prompt_for_input_players
    prompt_and_check_number_of_players_input
    prompt_and_check_player_names_input
  end

  def display_welcome_message_and_players_prompt
    puts "Welcome to Twenty-One"
    puts "How many players will there be today? "
  end

  def prompt_and_check_number_of_players_input
    input = nil

    loop do
      input = gets.chomp.to_i
      break if (input > 0) && (input < 5)
      puts "Please enter a reasonable number of players."
    end

    @number_of_players = input
  end

  def prompt_and_check_player_names_input
    (1..number_of_players).each do |num|
      puts "Enter a name for Player #{num}: "
      name = nil
      loop do
        name = gets.chomp
        break unless name.strip.empty?
        puts "Enter a valid name please."
      end
      @players << Player.new(name)
    end
  end

  def deal_initial_cards_to_players
    @players.each do |player|
      2.times { @dealer.deal(player) }
    end
  end

  def deal_initial_cards_to_dealer
    2.times { @dealer.deal(@dealer) }
  end

  def deal_card_to(player)
    @dealer.deal(player)
  end

  def display_player_turn_info(name, hand_total)
    puts "==> #{name}'s turn..."
    puts "==> #{name}'s hand total is #{hand_total}"
    puts ""
  end

  def participant_hit_or_stay_loop(player)
    loop do
      input = player_hit_stay_prompt_input

      hit_chosen(player) if ['h', 'hit'].include? input
      break stay_chosen(player) if ['s', 'stay'].include? input
      break display_player_busts(player) if player.busted?
    end
  end

  def player_hit_stay_prompt_input
    puts "==> Would you like to (h)it or (s)tay?"
    input = nil

    loop do
      input = gets.chomp.downcase
      break if ['h', 'hit', 's', 'stay'].include?(input)
      puts "==> Please select the option to hit or stay your turn."
    end

    input
  end

  def hit_chosen(player)
    deal_card_to(player)
    puts "#{player.name} hits!"
    puts ""
    puts "==> #{player.last_card_dealt} was dealt and your hand."
    puts "==> Your total is now #{player.hand_total}."
  end

  def stay_chosen(player)
    puts "#{player.name} stays!"
    puts ""
  end

  def display_player_busts(player)
    puts "==> #{player.name}'s total is #{player.hand_total}, you busted!"
    puts ""
  end

  def prompt_to_continue
    puts "==> Press Enter to continue..."
    gets
  end

  def prompt_to_continue_and_clear
    prompt_to_continue
    clear
  end

  def dealer_hit_or_stay_loop
    puts "==> #{dealer.name} the Dealer's turn..."
    prompt_to_continue

    loop do
      break stay_chosen(dealer) if dealer.not_busted? &&
                                   dealer.hand_total >= 15
      break if dealer.busted?
      hit_dealer
    end
  end

  def hit_dealer
    deal_card_to(@dealer)
    puts "==> #{dealer.name} hits!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Twenty-One, goodbye!!!"
  end

  def find_possible_winners
    players_not_busted = players.select(&:not_busted?)
    hand_totals = players_not_busted.map(&:hand_total)
    highest_hand_total = hand_totals.max
    total_winners = hand_totals.count(highest_hand_total)

    players_not_busted.max_by(total_winners, &:hand_total)
  end

  def players_won(winners_pool)
    return [:player, winners_pool.first] if winners_pool.size == 1
    [:players, winners_pool]
  end

  def dealer_won
    [:dealer, dealer]
  end

  def joinor(names, delimiter=', ', word='and')
    names[-1] = "#{word} #{names[-1]}" if names.size > 1
    if names.size > 2
      names.join(delimiter)
    else
      names.join(' ')
    end
  end
end

Game.new.start
