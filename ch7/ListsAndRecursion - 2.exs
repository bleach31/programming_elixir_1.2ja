defmodule MyList do
    def max([]) do
        IO.puts "error"
    end
    
    def max([head|tail]) do
        _max(tail,head)
    end
    
    defp _max([],maxnum) do
        maxnum
    end
    defp _max([ head | tail ], maxnum) when head >= maxnum do
        _max(tail, head)
    end
    
    defp _max([ head | tail ], maxnum) when head < maxnum do
        _max(tail, maxnum)
    end
end

IO.puts MyList.max [4, 2, 7, 1]
IO.puts MyList.max [4, 2, 7, 1,9]
IO.puts MyList.max [-4, 2, 7, 1,9]
IO.puts MyList.max [40, 2, 7, 1,9]
IO.puts MyList.max []
IO.puts MyList.max [9]