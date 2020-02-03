
defmodule MyString do
    def calculate(str) do
        str = Enum.filter(str,&(&1 != ?\s))  # delete spaces e.g. '123+27'

        index = Enum.find_index(str, &(&1 in '+-*/' ))
        lhs = Enum.slice(str, 0..index-1) # '127'
        op  = Enum.slice(str, index..index)
        rhs = Enum.slice(str, index+1..length(str)-1)
        _cal(List.to_integer(lhs),op,List.to_integer(rhs))
    end

    defp _cal(lhs,op,rhs) when op == [?+] do
        lhs + rhs
    end
    defp _cal(lhs,op,rhs) when op == [?-] do
        lhs - rhs
    end
    defp _cal(lhs,op,rhs) when op == [?*] do
        lhs * rhs
    end
    defp _cal(lhs,op,rhs) when op == [?/] do
        lhs / rhs
    end
end

IO.inspect MyString.calculate('123 + 27') # => 150
IO.inspect MyString.calculate('123 - 27') # => 96
IO.inspect MyString.calculate('123 * 27') # => 3321
IO.inspect MyString.calculate('123 / 27') # => 4.55...