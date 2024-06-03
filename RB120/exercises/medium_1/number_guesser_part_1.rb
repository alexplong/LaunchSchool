# Create an object-oriented number guessing class for numbers in the range 1 to 100, with a limit of 7 guesses per game. The game should play like this:
# Note that a game object should start a new game with a new number to guess with each call to #play.

## Guessing Game Spike
# - Create a number guessing game where player needs guess the winning number between a range of numbers
# - The game starts when the #play method is invoked
# - The game gives the user 7 attempts to guess the number
# - Let player know if the number input is out of range and allow an attempt retry
# - Let player know if they are within range, if their number is lower or higher than the selected number



# game = GuessingGame.new
# game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 104
# Invalid guess. Enter a number between 1 and 100: 50
# Your guess is too low.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 75
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 85
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 0
# Invalid guess. Enter a number between 1 and 100: 80

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 81
# That's the number!

# You won!

class GuessingGame
  RANGE = (1..100)
  ATTEMPTS = 7

  RESPONSE_AFTER_GUESS = {
    high: "Your guess is too high..",
    low: "Your guess is too low..",
    match: "You got the secret number!."
  }

  OUTCOME = {
    win: "You've won!",
    lose: "You've lost..."
  }

  def initialize
    @secret_number = nil
    @attempts_remaining = nil
  end

  def play
    reset
    play_game
  end

  private

  def reset
    @secret_number = RANGE.to_a.sample
    @attempts_remaining = ATTEMPTS
  end

  def play_game
    guess = nil

    loop do 
      attempts_remaining
      display_range
      guess = guess_secret_number

      break if @attempts_remaining <= 0 || guess == :win
    end

    puts OUTCOME[guess]
  end

  def attempts_remaining
      puts "You have #{@attempts_remaining} guesses remaining."
  end

  def display_range
      puts "Enter a number between #{RANGE.first} and #{RANGE.last}:"
  end

  def guess_secret_number
      user_input = nil

    loop do
      user_input = gets.chomp.to_i
      break if RANGE === user_input
      puts "Invalid guess. Enter a number between #{RANGE.first} and #{RANGE.last}:"
    end

    if user_input == @secret_number
      puts RESPONSE_AFTER_GUESS[:match]
      return :win
    end
    
    puts RESPONSE_AFTER_GUESS[:low] if user_input < @secret_number
    puts RESPONSE_AFTER_GUESS[:high] if user_input > @secret_number

    @attempts_remaining -= 1
    :lose
  end
end

game = GuessingGame.new
game.play