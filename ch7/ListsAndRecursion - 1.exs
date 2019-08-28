defmodule MyList do
    def mapsum(list,func) do 
        _mapsum(list, 0, func)
    end

    defp _mapsum([], value, _) do
        value
    end
    
    defp _mapsum([head | tail], value, func) do
        _mapsum(tail, func.(head) + value, func)
    end
end

IO.puts MyList.mapsum [1, 2, 3], &(&1 * &1)

IO.puts MyList.mapsum [1, 2, 3], &(&1 * 2)