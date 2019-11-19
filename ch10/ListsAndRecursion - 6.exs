
defmodule MyList do
    def flatten(list) do
        #_flatten(Enum.reverse(list),[])
        
        Enum.reverse(_flatten(list,[]))
    end

    defp _flatten([head|tail],flat) when is_list(head) do # headがリストだったらこっちに入る
        IO.inspect "a"
        IO.inspect head
        IO.inspect tail
        IO.inspect flat
        flat2 = _flatten(head,flat)
        IO.inspect flat2
        _flatten(tail,flat2)
    end

    defp _flatten([head|tail],flat) do # head リストでない
        IO.inspect "b"
        IO.inspect head
        IO.inspect tail
        IO.inspect flat
        _flatten(tail,[head|flat])
    end
    
    defp _flatten([],flat) do
        IO.inspect "c"
        IO.inspect flat
    end


    def flatten2( [head|tail] ) do # headがリストだったらこっちに入る
        Enum.concat(flatten(head),flatten(tail))
    end
    def flatten2([]) do
        []
    end
    def flatten2(head) do # head リストでない（ホントは空リストもマッチする）
        [head]
    end
    

end

IO.inspect MyList.flatten([ 1, [ 2, 3, [4] ], 5, [[[6]]]])

#IO.inspect MyList.flatten([ 1, [ 2, 3, [4] ]])
