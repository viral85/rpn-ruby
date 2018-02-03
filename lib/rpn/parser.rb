module RPN
  class Parser

    def parse_numbers(stack)
      stack.map.each { |tok|
        if /[+-]?[0-9]/ =~ tok
          begin
            eval(tok)
          rescue SyntaxError => e
            raise CalcError.new(e.message)
          end
        else
          tok
        end
      }
    end

  end
end
