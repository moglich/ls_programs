VALID_CHOICES = {'r' => 'rock',
                 'p' => 'paper',
                 's' => 'scissors'}
def prompt(msg)
  puts "=> #{msg}"
end

loop do
  choice = ''
  loop do
    prompt("Choose one: rock(r), paper(p), scissors(s)")
    choice = gets.chomp
    if VALID_CHOICES.keys.include? choice
      choice = VALID_CHOICES[choice]
      break
    else
      puts "wrong, try again"
    end
  end

  computer_choice = VALID_CHOICES.values.sample

  prompt "You chose: #{choice}; the computer chose: #{computer_choice}"

  if choice == 'rock' && computer_choice == 'scissors' ||
      choice == 'paper' && computer_choice == 'rock' ||
      choice == 'scissors' && computer_choice == 'paper'
    prompt "You won"
  elsif choice == computer_choice
    prompt "It's a tie"
  else
    prompt "You lost"
  end
  
  prompt "Do you want to play again? [y/n]"
  break unless gets.chomp == 'y'
end
