# START
# GET principle = loan amount min
# GET apr = annual percent rate in PERCENT
# GET loan_years = duration in years

# SET monthly_interest_rate = apr / 12
# SET loan_months = loan_years / 12

def prompt(message)
  puts "=> #{message}"
end

def integer?(number)
  number.to_i.to_s == number && number.to_i > 0
end

def float?(number)
  number.to_f.to_s == number && number.to_f > 0 
end
  
def number?(number)
  integer?(number) || float?(number)
end

prompt("Welcome To Your Payment Calculator")
prompt("")
prompt("Please have your loan amount in $, annual percentage rate (APR) in %, and your loan years ready")
prompt("----------------------------------------------------------------")

principle_amount = ''
prompt("Please enter your loan amount: ")
loop do
  principle_amount = gets.chomp
  break if integer?(principle_amount)
  prompt("Please enter a correct dollar amount")
end

prompt("Please enter your APR (in %): ")
apr = nil
loop do
  apr = gets.chomp
  break if number?(apr)
  prompt("invalid, please try again")
end
monthly_interest_rate = (apr.to_f / 12) / 100

prompt("Please enter your loan duration (in years): ")
loan_years = nil
loop do
  loan_years = gets.chomp
  break if number?(loan_years)
  prompt("Please enter a correct term for your loan")
end
loan_months = loan_years.to_f * 12

prompt("----------------------------------------------------------------")
prompt("Calculate your loan amount ................")
monthly_payment = principle_amount.to_f * 
                  (monthly_interest_rate / 
                  (1 - (1 + monthly_interest_rate)**(-loan_months)))

prompt("Your monthly payment amount is #{monthly_payment}")

