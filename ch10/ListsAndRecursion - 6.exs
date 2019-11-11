
defmodule MyList do
    def flatten(list) do
        _flatten(Enum.reverse(list),[])
    end


    defp _flatten([head|tail],flat) when is_list(head) do # headがリストだったらこっちに入る
        _flatten(tail,_flatten(head,flat))
    end

    defp _flatten([head|tail],flat) do # head リストでない
        _flatten(tail,[head|flat])
    end
    
    defp _flatten([],flat) do
        flat
    end

#    defp _flatten(nolist,_flat) do
#        nolist
#    end

end

IO.inspect MyList.flatten([ 1, [ 2, 3, [4] ], 5, [[[6]]]])