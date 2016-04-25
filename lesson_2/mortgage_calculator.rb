def calculate_monthy_payment(loan_amount, time_in_month, interest_rate)
  interest_rate = ((interest_rate.to_f / 100) / 12)
  (loan_amount * (interest_rate * (1 + interest_rate)**time_in_month)) / ((1 + interest_rate)**time_in_month - 1)
end

def prompt(msg)
  puts "=> #{msg}"
end

prompt "loan amount:"
loan_amount = gets.chomp.to_i

prompt "Interest rate:"
interest_rate = gets.chomp.to_i

prompt "loan duration (in years):"
loan_duration = gets.chomp.to_i

time_in_month = loan_duration * 12

monthly_payment = calculate_monthy_payment(loan_amount, time_in_month, interest_rate)

prompt "Monthly payment = #{format('%02.2f', monthly_payment)}"
