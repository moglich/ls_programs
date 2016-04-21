OPERATORS = ['+', '-', '*', '/']

Kernel.puts("- Calculator -")
Kernel.puts()

Kernel.puts("Please enter number 1: ")
number1 = Kernel.gets().to_i()
Kernel.puts("Please enter number 2: ")
number2 = Kernel.gets().to_i()
Kernel.puts()

Kernel.puts("Choose operation; + [0], - [1], * [2], / [3]:")
operator = Kernel.gets().to_i


result = number1.send(OPERATORS[operator], number2)
Kernel.puts(result)
