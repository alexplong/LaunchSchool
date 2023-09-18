def minilang(commands)
  stack = []
  program_commands = commands.split
  register = 0
  program_commands.each do |command|
    case command
    when "PUSH" then stack << register.to_i
    when "ADD" then register = register + stack.pop.to_i
    when "SUB" then register = register - stack.pop.to_i
    when "MULT" then register = register * stack.pop.to_i
    when "DIV" then register = register / stack.pop.to_i
    when "MOD" then register = register % stack.pop.to_i
    when "POP" then register = stack.pop.to_i
    when "PRINT" then puts register
    else register = command.to_i
    end
  end
end

minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5 #

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4 #
# 7 #

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)