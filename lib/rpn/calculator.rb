module RPN
  class Calculator
    attr_reader :parser, :stack
    def initialize
      @stack = Stack.new
      @parser = Parser.new
    end
    def solve string
      result = stack.eval_stack(parser.parse_numbers(string.split()))
      if result.length > 1
        raise CalcError.new("Not enough operators")
      else
        return result
      end
    end
  end
end
