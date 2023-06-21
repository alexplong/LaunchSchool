VALID_CHOICES = %w(rock paper scissors lizard spock)
SHORTENED_CHOICES = %w(r p sc l sp)

def prompt(message)
  Kernel.puts("=> #{message}")
end

# def win?(first, second)
#   (first == 'rock' && (second == 'scissors' || second == 'lizard')) ||
#     (first == 'paper' && (second == 'rock' || second == 'spock')) ||
#     (first == 'scissors' && (second == 'paper' || second == 'lizard')) ||
#     (first == 'lizard' && (second == 'paper' || second == 'spock')) ||
#     (first == 'spock' && (second == 'scissor' || second == 'rock'))
# end

def win?(first, second)
  (first.start_with?('r') && (second.start_with?('sc') || second.start_with?('l'))) ||
    (first.start_with?('p') && (second.start_with?('r') || second.start_with?('sp'))) ||
    (first.start_with?('sc') && (second.start_with?('p') || second.start_with?('l'))) ||
    (first.start_with?('l') && (second.start_with?('p') || second.start_with?('sp'))) ||
    (first.start_with?('sp') && (second.start_with?('sc') || second.start_with?('r')))
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You win")
  elsif win?(computer, player)
    prompt("Computer wins")
  else
    prompt("Tie game")
  end
end

def update_score(choice, computer_choice, score)
  if win?(choice, computer_choice)
    score[:player] += 1
  elsif win?(computer_choice, choice)
    score[:computer] += 1
  end
end

score = { player: 0, computer: 0 }

loop do
  choice = ''

  prompt("Current Score: Player: #{score[:player]} Computer: #{score[:computer]}")

  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets.chomp
    break if VALID_CHOICES.include?(choice) || SHORTENED_CHOICES.include?(choice)
    prompt("That's not a valid choice.")
  end

  computer_choice = VALID_CHOICES.sample()
  Kernel.puts("You chose: #{VALID_CHOICES[SHORTENED_CHOICES.index(choice)]}, computer chose: #{computer_choice}")

  display_results(choice, computer_choice)

  update_score(choice, computer_choice, score)

  if score[:player] == 3
    prompt("You win Player")
    break
  elsif score[:computer] == 3
    prompt("Computer kicked yer butt")
    break
  end

  prompt("Play again? ")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end
