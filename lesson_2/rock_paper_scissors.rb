VALID_CHOICES = { 'r' => 'rock',
                  'p' => 'paper',
                  's' => 'scissors',
                  'o' => 'spock',
                  'l' => 'lizard' }.freeze

WINNING_STATES = { 'rock' => %w(lizard scissors),
                   'paper' => %w(rock spock),
                   'scissors' => %w(paper lizard),
                   'spock' => %w(scissors rock),
                   'lizard' => %w(spock paper) }.freeze

def win?(player1_choice, player2_choice)
  WINNING_STATES[player1_choice].include? player2_choice
end

def winner?(user, computer)
  if win?(user, computer)
    'user'
  elsif win?(computer, user)
    'computer'
  end
end

def display_results(user, computer, winner)
  prompt "You chose: #{user}; the computer chose: #{computer}"

  if winner == 'user'
    prompt "You won"
  elsif winner == 'computer'
    prompt "Computer won"
  else
    prompt "It's a tie"
  end
end

def prompt(msg)
  puts "=> #{msg}"
end

player_score = 0
computer_score = 0

loop do
  system('clear screen')

  choice = ''
  loop do
    prompt("Choose one: (r)ock, (p)aper, (s)cissors, sp(o)ck, (l)izard")
    choice = gets.chomp
    if VALID_CHOICES.keys.include? choice
      choice = VALID_CHOICES[choice]
      break
    else
      puts "wrong input, try again"
    end
  end

  computer_choice = VALID_CHOICES.values.sample

  winner = winner?(choice, computer_choice)

  if winner == 'user'
    player_score += 1
  elsif winner == 'computer'
    computer_score += 1
  end

  display_results(choice, computer_choice, winner)

  prompt "Scores: You: #{player_score} Computer: #{computer_score}"
  if player_score == 5
    prompt "You won"
    break
  elsif computer_score == 5
    prompt "Computer won"
    break
  end


  prompt "Do you want to play again? [y/n]"
  break unless gets.chomp == 'y'
end
