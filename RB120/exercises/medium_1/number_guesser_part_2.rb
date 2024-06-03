=begin

In the previous exercise, you wrote a number guessing game that determines a secret number between 1 and 100, and gives the user 7 opportunities to guess the number.

Update your solution to accept a low and high value when you create a GuessingGame object, and use those values to compute a secret number for the game. You should also change the number of guesses allowed so the user can always win if she uses a good strategy. You can compute the number of guesses with:

=end

class GuessingGame
  RESPONSE_AFTER_GUESS = {
    high: "Your guess is too high..",
    low: "Your guess is too low..",
    match: "You got the secret number!."
  }

  OUTCOME = {
    win: "You've won!",
    lose: "You've lost..."
  }

  def initialize(floor, ceiling)
    @range = (floor..ceiling)
    @attempts = Math.log2(ceiling - floor).to_i + 1
    @secret_number = nil
    @attempts_remaining = nil
  end

  def play
    reset
    play_game
  end

  private

  def reset
    @secret_number = @range.to_a.sample
    @attempts_remaining = @attempts
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
      puts "Enter a number between #{@range.first} and #{@range.last}:"
  end

  def guess_secret_number
      user_input = nil

    loop do
      user_input = gets.chomp.to_i
      break if @range === user_input
      puts "Invalid guess. Enter a number between #{@range.first} and #{@range.last}:"
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


game = GuessingGame.new(501, 1500)
game.play