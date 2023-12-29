class Move
  VALID_MOVES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

  WINNING_MOVES = {
    'rock' => ['scissors', 'lizard'],
    'paper' => ['rock', 'spock'],
    'scissors' => ['paper', 'lizard'],
    'lizard' => ['paper', 'spock'],
    'spock' => ['rock', 'scissors']
  }

  def initialize(choice)
    @value = choice
  end

  def >(other_move)
    WINNING_MOVES[@value].include?(other_move)
  end

  def <(other_move)
    WINNING_MOVES[other_move.to_s].include?(@value)
  end

  def to_s
    @value
  end
end

class Score
  def initialize
    @points = 0
  end

  def increment
    @points += 1
  end

  def >=(num)
    @points >= num
  end

  def ==(num)
    @points == num
  end

  def reset
    @points = 0
  end

  def to_s
    @points.to_s
  end
end

class Player
  attr_accessor :move, :name
  attr_reader :score

  def initialize
    @score = Score.new
    set_name
  end
end

class Human < Player
  def set_name
    n = ""
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil

    loop do
      puts "Please choose rock, paper, scissors, lizard, or spock:"
      choice = gets.chomp
      break if Move::VALID_MOVES.include? choice
      puts "Sorry, invalid choice."
    end

    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    self.move = Move.new(Move::VALID_MOVES.sample)
  end
end

# Game Orchestration Engine
class RPSGame
  attr_accessor :human, :computer, :history

  def initialize
    @human = Human.new
    @computer = Computer.new
    @history = { human.name => [], computer.name => [] }
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock. Good bye"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
  end

  def determine_round_winner
    if human.move > computer.move
      human.score.increment
      display_round_winner(human.name)
    elsif human.move < computer.move
      display_round_winner(computer.name)
      computer.score.increment
    else
      display_round_winner
    end
  end

  def display_round_winner(winner = nil)
    if winner
      puts "#{winner} won!"
    else
      puts "It's a tie!"
    end
  end

  def display_score
    puts "#{human.name}'s score: #{human.score}"
    puts "#{computer.name}'s score: #{computer.score}"
  end

  def winner?
    (human.score == 3) || (computer.score == 3)
  end

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      display_moves
      determine_round_winner
      display_score
      if winner?
        break unless play_again?
      end
    end
    display_goodbye_message
  end

  def play_again?
    answer = nil

    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, please enter y or n."
    end

    human.score.reset
    computer.score.reset

    return true if answer == 'y'
    return false if answer == 'n'
  end
end

RPSGame.new.play
