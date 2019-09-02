defmodule MyList do
    
    def caesar([],n) do
    end

    def caesar([head|tail],n) when (head + n) <= 122 do
        # IO.puts [(head - 97) + n) mod 26 + 97]
        IO.puts [head + n]
        caesar(tail,n)
    end
    
    def caesar([head|tail],n) when (head + n) > 122 do
        IO.puts [rem((head + n),122) + 96]
        caesar(tail,n)
    end
end

IO.puts MyList.caesar('ryvkve', 13)