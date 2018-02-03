require_relative 'rpn/stack'
require_relative 'rpn/parser'
require_relative 'rpn/calculator'
require_relative 'rpn/calc_error'
require 'readline'


module RPN
end

my_rpn = RPN::Calculator.new

while buf = Readline.readline("> ", true)

  if /^\s*q/ =~ buf
    break
  end

  begin
    result = my_rpn.solve buf
  rescue RPN::CalcError => e
    puts "Error: %s" % e.message
    next
  end

  Readline::HISTORY.push(result[0].to_s)
  puts result

end
