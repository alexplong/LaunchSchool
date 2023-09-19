require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd, score)
  system "clear"
  puts "Player is #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts "Player Score: #{score["Player"]}"
  puts "Computer Score: #{score["Computer"]}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |n| new_board[n] = INITIAL_MARKER }
  new_board
end

def initialize_score
  { "Player"=> 0, "Computer"=> 0 }
end

def empty_squares(brd)
  brd.keys.select { |pos| brd[pos] == INITIAL_MARKER }
end

def joinor(open_squares, punctuation=', ', join_word='or')
  open_squares[-1] = "#{join_word} #{open_squares[-1]}"
  open_squares.join(punctuation)
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

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
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
  score.each do |player, score| 
    return player  if score >= 5
  end
  nil
end

score = initialize_score

loop do
  board = initialize_board

  loop do
    display_board(board, score)

    player_places_piece!(board)
    break if someone_won_game?(board) || board_full?(board)

    computer_places_piece!(board)
    break if someone_won_game?(board) || board_full?(board)
  end

  display_board(board, score)

  if someone_won_game?(board)
    update_score(score, detect_game_winner(board))
    prompt "#{detect_game_winner(board)} won game!"
  else
    prompt "It's a tie!"
  end

  if someone_won_series?(score)
    prompt "#{detect_series_winner(score)} won the series!!!!"
    return
  end

  prompt "Continue? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"
