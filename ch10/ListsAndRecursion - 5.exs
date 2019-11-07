defmodule MyEnum do

    def all?([head|tail], func) do
        if func.(head) == false do
            false
        else
            all?(tail,func)
        end
    end
    
    def all?([], _func), do: true


end

list = Enum.to_list 1..5
IO.inspect MyEnum.all?(list, &(&1 < 6))