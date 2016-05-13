def display_board(board)
  system('clear screen')
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts '---+---+---'
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts '---+---+---'
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def set_field(field, mark, board)
  board[field] = mark
end

def valid_choice?(input, board)
  input.length == 1 &&
    ((1..9).cover? input.to_i) &&
    (free_fields(board).include? input.to_i - 1)
end

def field_free?(field, board)
  board[field] == ' '
end

def free_fields(board)
  free = []
  board.each_with_index do |field, index|
    free << index if field == ' '
  end
  free
end

def winner?(board)
  winning_combos = [[1, 2, 3], [1, 4, 7], [1, 5, 9], [2, 5, 8], [4, 5, 6]]
end

def play_game
  board = Array.new(9) { ' ' }
  user_choice = ''
  display_board(board)

  loop do
    loop do
      puts 'Please choose field (1-9):'
      user_choice = gets.chomp
      break if valid_choice?(user_choice, board)
      puts 'Invalid choice! Please try again'
    end

    user_choice = (user_choice.to_i - 1)

    set_field(user_choice, 'x', board)

    if (computer_choice = free_fields(board).sample)
      set_field(computer_choice, 'o', board)
    end

    display_board(board)
    # exit if winner?

    break if free_fields(board).empty? # || winner?
  end
end

loop do
  play_game
  puts 'Do you want to play again? [y/n]'
  replay = gets.chomp
  break unless replay == 'y'
end

puts 'Good bye'
