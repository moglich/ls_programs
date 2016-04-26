VALID_CHOICES = { 'r' => 'rock',
                  'p' => 'paper',
                  's' => 'scissors',
                  'o' => 'spock',
                  'l' => 'lizard' }.freeze

def win?(player1, player2)
  player1 == 'rock' && player2 == 'lizard' ||
    player1 == 'paper' && player2 == 'rock' ||
    player1 == 'scissors' && player2 == 'paper' ||
    player1 == 'lizard' && player2 == 'spock' ||
    player1 == 'spock' && player2 == 'scissors' ||
    player1 == 'scissors' && player2 == 'lizard' ||
    player1 == 'lizard' && player2 == 'paper' ||
    player1 == 'paper' && player2 == 'spock' ||
    player1 == 'spock' && player2 == 'rock' ||
    player1 == 'rock' && player2 == 'scissors'
end

def display_results(user, computer)
  prompt "You chose: #{user}; the computer chose: #{computer}"

  if win?(user, computer)
    prompt "You won"
  elsif win?(computer, user)
    prompt "Computer won"
  else
    prompt "It's a tie"
  end
end

def prompt(msg)
  puts "=> #{msg}"
end

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

  display_results(choice, computer_choice)

  prompt "Do you want to play again? [y/n]"
  break unless gets.chomp == 'y'
end
