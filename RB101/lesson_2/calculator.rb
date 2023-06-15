require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
# configuration file above!

def prompt(message)
    puts "=> #{message}"
end

def integer?(num)
    # num == '0' || num.to_i != 0 # edge case here, 00 would be invalid
    num.to_i.to_s == num # 00 invalid
end

def float?(num)
    num.to_f.to_s == num || (num == '0' && num.to_f.to_s == '0.0') # 00 invalid too
end

def number?(num)
    # prev we checked for integer, can add another check for floats
    integer?(num) || float?(num)
end

def operator_to_string(selection, arr)
    word = case selection
          when "1"
              # "Adding"
              arr['add']
          when "2"
              # "Subtracting"
              arr['subtract']
          when "3"
              # "Multiplying"
              arr['multiply']
          when "4"
              # "Dividing"
              arr['divide']
          end
  word
end


prompt(MESSAGES['welcome'])

loop do
    
    x = nil
    y = nil
    
    
    loop do
        prompt(MESSAGES['first_num'])
        x = gets.chomp
        if integer?(x)
            break
        else
            prompt(MESSAGES['invalid_first_num'])
        end
    end
    
    loop do
        prompt(MESSAGES['second_num'])
        y = gets.chomp
        if integer?(y)
            break
        else
            prompt(MESSAGES['invalid_second_num'])
        end
    end
    
operator_prompt = <<-MSG
What operation would you like to perform?
1) add
2) subtract
3) multiply
4) divide

MSG
    
    prompt(operator_prompt)
    
    selection = nil
    
    loop do
        selection = gets.chomp
        # %w(1 2 3 4) # is also an array of strings, wtf
        if ["1","2","3","4"].include?(selection)
            break
        elsif selection.empty?
            prompt(MESSAGES['empty_operation'])
        else
            prompt(MESSAGES['invalid_operation'])
        end
    end
    
    prompt("#{operator_to_string(selection, MESSAGES)} the two numbers....")
    
    result = case selection
            when "1"
                x.to_i() + y.to_i()
            when "2"
                x.to_i() - y.to_i()
            when "3"
                x.to_i() * y.to_i()
            else
                x.to_f() / y.to_f()
            end
    
    prompt("The result is #{result}")
    
    prompt(MESSAGES['run_again'])
    again = gets.chomp
    
    break unless again.downcase.start_with?('y')
    
end

prompt(MESSAGES['thanks'])