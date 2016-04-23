INTRO_MSG = "Welcome to this calculator app".freeze
OPERATORS = ['+', '-', '*', '/'].freeze

def valid_number?(number)
  true if /^\d*\.?\d*$/.match number
end

def get_number
  loop do
    puts "Please enter number:"
    number = gets.chomp
    return number.to_f if valid_number? number
    puts "Number not valid! (1234 / 12.34):"
  end
end

system('clear screen')

puts INTRO_MSG
puts

number1 = get_number
number2 = get_number

puts "Choose operation; + [0], - [1], * [2], / [3]:"
operator = gets.to_i

result = number1.send(OPERATORS[operator], number2)
puts "Result: #{result}"
