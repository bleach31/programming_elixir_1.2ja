
defmodule MyList do
    def flatten(list) do
        _flatten(list,[])
    end

    defp _flatten([head|tail],flat) when is_list(head) do # head リストだったらこっちに入る
        _flatten(head,flat)
        _flatten(tail,flat)
        IO.inspect flat
    end


    defp _flatten([head|tail],flat) do # head リストじゃなかったらこっちに入る
        _flatten(tail,[head|flat])
    end

    defp _flatten([],_flat) do
    end

#    defp _flatten(nolist,flat) do
#        nolist
#    end


end

IO.inspect MyList.flatten([ 1, [ 2, 3, [4] ], 5, [[[6]]]])