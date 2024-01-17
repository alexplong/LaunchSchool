require "pry"

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    reset
  end

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def round_winner?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def markers_at_positions(arr)
    @squares.values_at(*arr).collect(&:marker)
  end

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.uniq.size == 1
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def marked?
    marker != INITIAL_MARKER
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Score
  attr_reader :points
  
  def initialize
    reset
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
  
  def +(num)
    @points + num
  end
  
  def reset
    @points = 0
  end
  
  def to_s
    @points.to_s
  end
end

class Player
  attr_reader :marker, :name, :score

  def initialize
    @marker = select_marker
    @name = select_name
    @score = Score.new
  end
end

class Human < Player
  def select_marker
    marker_choice = nil

    puts "Please choose a marker: X or O"
    loop do
      marker_choice = gets.chomp.upcase
      break if ['X', 'O'].include? marker_choice
      puts "Please choose a valid marker."
    end
    marker_choice
  end

  def select_name
    name_choice = "Player 1"

    puts "Please enter your name: "
    user_input = gets.chomp
    name_choice = user_input unless user_input.strip.empty?

    name_choice
  end
end

class Computer < Player
  def select_marker
    if TTTgame.player_marker == 'X'
      'O'
    else
      'X'
    end
  end

  def select_name
    ['R2D2', 'Chappie', 'T1000'].sample
  end

  def defensive_move(board)
    Board::WINNING_LINES.each do |line|
      current_move = board.markers_at_positions(line)
      if current_move.count(TTTgame.player_marker) == 2 && 
         current_move.count(Square::INITIAL_MARKER) == 1
        return line[current_move.index(Square::INITIAL_MARKER)]
      end
    end

    nil
  end

  def offensive_move(board)
    if board.markers_at_positions([5]) == [" "]
      return 5 
    else
      Board::WINNING_LINES.each do |line|
        current_move = board.markers_at_positions(line)
        if current_move.count(TTTgame.computer_marker) == 2 &&
          current_move.count(Square::INITIAL_MARKER) == 1
          return line[current_move.index(Square::INITIAL_MARKER)]
        end
      end

      nil
    end
  end
end

class TTTgame
  @@human_marker = nil
  @@computer_marker = nil
  @@first_to_move = nil

  attr_reader :board, :human, :computer, :current_marker

  def initialize
    @board = Board.new
    @human = Human.new
    @@human_marker = @human.marker

    @computer = Computer.new
    @@computer_marker = @computer.marker
    
    @@first_to_move = @@human_marker
    
    @current_marker = @@human_marker
  end

  def self.player_marker
    @@human_marker
  end

  def self.computer_marker
    @@computer_marker
  end

  def play
    clear
    display_welcome_message
    main_game
    display_goodbye_message
  end

  private

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def display_round_winner
    if board.winning_marker
      puts "#{board.winning_marker} wins Round: #{human.score.points + computer.score.points}!"
    else 
      puts "Round tie!!!"
    end
  end

  def clear
    system "clear"
  end

  def display_board
    puts "#{human.name}: #{human.marker}. #{computer.name}: #{computer.marker}."
    puts ""
    board.draw
    puts ""
    display_score
  end

  def display_board_and_clear_screen
    clear
    display_board
  end

  def display_score
    puts "#{human.marker} Points: #{human.score}"
    puts "#{computer.marker} Points: #{computer.score}"
    puts ""
  end

  def joinor(unmarked_squares, delimiter=', ', word='or')
    unmarked_squares[-1] = "#{word} #{unmarked_squares[-1]}" if unmarked_squares.size > 1
    unmarked_squares.join(delimiter)
  end

  def human_moves
    puts "Choose a square: #{joinor(board.unmarked_keys)}: "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def computer_moves
    offense = computer.offensive_move(board)
    defense = computer.defensive_move(board)

    if !!offense
      square = offense
    elsif !!defense
      square = defense
    else
      square = board.unmarked_keys.sample
    end
    
    board[square] = computer.marker
  end

  def display_result

    case board.winning_marker
    when @@human_marker
      human.score.increment
      display_board
      puts "You won!"
    when @@computer_marker
      computer.score.increment
      display_board
      puts "You lose! Computer wins!"
    else 
      display_board
      puts "The board is full."
    end
  end

  def play_again?
    answer = nil

    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      if %w(y n).include? answer
        @human.score.reset
        @computer.score.reset
        break
      end
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def continue_prompt
    puts "Press Enter to continue"
    gets
  end

  def reset
    board.reset
    @current_marker = @@first_to_move
    clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end

  def human_turn?
    @current_marker == @@human_marker
  end

  def current_player_moves
    if @current_marker == @@human_marker
      human_moves
      @current_marker = @@computer_marker
    else
      computer_moves
      @current_marker = @@human_marker
    end
  end

  def player_move
    loop do
      current_player_moves
      break if board.round_winner? || board.full?

      display_board_and_clear_screen if human_turn?
    end
  end
  
  def game_winner?
    @human.score == 3 || @computer.score == 3
  end

  def main_game
    loop do
      display_board
      player_move
      clear
      display_result
      if game_winner?
        break unless play_again?
      else
        display_round_winner
        continue_prompt
      end
      reset
    end
  end
end

game = TTTgame.new
game.play
