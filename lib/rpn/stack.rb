module RPN
  class Stack

    def eval_stack(tokens)
      tokens.each_with_index.reduce([]) { |stack, (token, index)|
        if token.class == String
          operands = stack.each_with_index.select { |o,idx|
            (o.respond_to? token) && (o.method(token).arity.abs == stack.length - idx - 1)
          }

          if operands.empty?
            raise CalcError.new(index, "No suitable arguments for operator: %s" % token)
          else

            oper_index = operands[-1][-1]

            arguments = stack.slice!(oper_index+1,stack.length-oper_index)

            operand = stack.pop()
          end

          begin

            res = operand.send(token,*arguments)
          rescue StandardError => e
            raise CalcError.new(e.message)
          end
          stack.push(res)
        else
          stack.push(token)
        end
      }
     end

  end
end
