require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
CENTER_POSITION = 5

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
def display_board(brd, score)
  system "clear"
  puts "------------------------------"
  puts "| Player is #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER} |"
  puts "| Player Score: #{score['Player']}            |"
  puts "| Computer Score: #{score['Computer']}          |"
  puts "------------------------------"
  puts ""
  puts "     |     |                  +-+-+-+"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}               |1|2|3|"
  puts "     |     |                  +-+-+-+"
  puts "-----+-----+-----             |4|5|6|"
  puts "     |     |                  +-+-+-+"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}               |7|8|9|"
  puts "     |     |                  +-+-+-+"
  puts "-----+-----+-----            POSITIONS"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

def initialize_board
  new_board = {}
  (1..9).each { |n| new_board[n] = INITIAL_MARKER }
  new_board
end

def initialize_score
  { "Player" => 0, "Computer" => 0 }
end

def initialize_player_order
  ["Computer", "Player"].sample
end

def announce_player_order(brd, first_player)
  if brd.values.all?(INITIAL_MARKER)
    prompt "#{first_player} goes first for this game."
    prompt "Press Enter to start."
    gets
  end
end

def alternate_player(player)
  if player == "Computer" then "Player" else "Computer" end
end

def empty_squares(brd)
  brd.keys.select { |pos| brd[pos] == INITIAL_MARKER }
end

def joinor(open_squares, delimiter=', ', word='or')
  open_squares[-1] = "#{word} #{open_squares[-1]}" if open_squares.length > 1
  open_squares.join(delimiter)
end

def player_places_piece!(brd)
  square = ''

  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def center_square_open?(brd)
  brd[CENTER_POSITION] == INITIAL_MARKER
end

def find_winning_square(brd)
  WINNING_LINES.each do |line|
    return (line.reject { |n| brd[n] == COMPUTER_MARKER }[0]) if
    brd.values_at(*line).count(COMPUTER_MARKER) > 1 &&
    brd.values_at(*line).count(INITIAL_MARKER) == 1
  end
  nil
end

def find_at_risk_square(brd)
  WINNING_LINES.each do |line|
    return (line.reject { |n| brd[n] == PLAYER_MARKER }[0]) if
    brd.values_at(*line).count(PLAYER_MARKER) > 1 &&
    brd.values_at(*line).count(INITIAL_MARKER) == 1
  end
  nil
end

def computer_places_piece!(brd)
  if center_square_open?(brd)
    brd[CENTER_POSITION] = COMPUTER_MARKER
  elsif !!find_winning_square(brd)
    winning_square = find_winning_square(brd)
    brd[winning_square] = COMPUTER_MARKER
  elsif !!find_at_risk_square(brd)
    at_risk_square = find_at_risk_square(brd)
    brd[at_risk_square] = COMPUTER_MARKER
  else
    square = empty_squares(brd).sample
    brd[square] = COMPUTER_MARKER
  end
end

def make_move(brd, player)
  if player == "Computer"
    computer_places_piece!(brd)
  elsif player == "Player"
    player_places_piece!(brd)
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won_game?(brd)
  !!detect_game_winner(brd)
end

def detect_game_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return "Player"
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return "Computer"
    end
  end
  nil
end

def update_score(score, winner)
  score[winner] += 1
end

def someone_won_series?(score)
  !!detect_series_winner(score)
end

def detect_series_winner(score)
  score.each do |player, points|
    return player if points >= 5
  end
  nil
end

score = initialize_score

loop do
  board = initialize_board
  first_player = initialize_player_order
  current_player = first_player

  loop do
    display_board(board, score)
    announce_player_order(board, first_player)

    make_move(board, current_player)
    current_player = alternate_player(current_player)
    if someone_won_game?(board)
      update_score(score, detect_game_winner(board))
      break
    elsif board_full?(board)
      break
    end
  end

  display_board(board, score)

  if someone_won_series?(score)
    # rubocop:disable Layout/LineLength
    prompt "#{detect_series_winner(score)} reached 5 points first. #{detect_series_winner(score)} won the series!!!!"
    # rubocop:enable Layout/LineLength
    return
  elsif someone_won_game?(board)
    prompt "#{detect_game_winner(board)} won game!"
  else
    prompt "It's a tie!"
  end

  prompt "Press Enter to Continue? (n to quit)"
  answer = gets.chomp
  break if answer.downcase.start_with?('n')
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"
